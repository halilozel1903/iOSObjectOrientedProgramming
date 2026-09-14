import Foundation

/// Immutable, `Sendable` snapshot that can safely cross concurrency domains.
public struct FleetEntry: Sendable, Equatable {
    public let model: String
    public let speedInKilometersPerHour: Double

    public init(model: String, speedInKilometersPerHour: Double) {
        self.model = model
        self.speedInKilometersPerHour = speedInKilometersPerHour
    }
}

/// An actor is a reference type whose mutable state is protected by the
/// compiler: concurrent callers are serialized instead of racing.
public actor VehicleFleet {
    private var speeds: [String: Double] = [:]

    public init() {}

    public func record(model: String, speedInKilometersPerHour speed: Double) {
        speeds[model] = speed
    }

    public func speed(of model: String) -> Double? {
        speeds[model]
    }

    public var entries: [FleetEntry] {
        speeds
            .map { FleetEntry(model: $0.key, speedInKilometersPerHour: $0.value) }
            .sorted { $0.model < $1.model }
    }

    public var fastest: FleetEntry? {
        entries.max { $0.speedInKilometersPerHour < $1.speedInKilometersPerHour }
    }
}
