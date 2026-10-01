import Foundation

/// Immutable telemetry that is implicitly `Sendable` and safe to share across
/// isolation domains.
public struct TelemetrySample: Sendable, Equatable {
    public let label: String
    public let value: Double

    public init(label: String, value: Double) {
        self.label = label
        self.value = value
    }
}

/// Reference type that opts into unchecked sendability after documenting the
/// manual synchronization contract (here: immutable after init).
public final class CalibrationTable: @unchecked Sendable {
    public let samples: [TelemetrySample]

    public init(samples: [TelemetrySample]) {
        self.samples = samples
    }

    public func value(for label: String) -> Double? {
        samples.first { $0.label == label }?.value
    }
}

/// Actor that exposes a `nonisolated` constant and accepts `isolated`
/// parameters for synchronous reads on a known executor.
public actor TelemetryHub {
    nonisolated public let stationName: String

    private var latest: [String: Double] = [:]

    public init(stationName: String) {
        self.stationName = stationName
    }

    public func record(_ sample: TelemetrySample) {
        latest[sample.label] = sample.value
    }

    public func value(for label: String) -> Double? {
        latest[label]
    }

    /// Cross-actor merge: hop to the other hub, take a snapshot, then write
    /// locally. No shared mutable state crosses isolation domains.
    public func merge(from other: TelemetryHub) async {
        for sample in await other.snapshot() {
            latest[sample.label] = sample.value
        }
    }

    public func snapshot() -> [TelemetrySample] {
        latest
            .map { TelemetrySample(label: $0.key, value: $0.value) }
            .sorted { $0.label < $1.label }
    }

    /// `isolated` parameter: the caller has already entered `hub`'s executor,
    /// so stored state can be read synchronously without `await`.
    public static func peek(
        _ hub: isolated TelemetryHub,
        label: String
    ) -> Double? {
        hub.latest[label]
    }
}
