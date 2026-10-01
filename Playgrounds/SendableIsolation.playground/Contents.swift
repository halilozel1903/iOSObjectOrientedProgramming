import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct TelemetrySample: Sendable {
    let label: String
    let value: Double
}

final class CalibrationTable: @unchecked Sendable {
    let samples: [TelemetrySample]
    init(samples: [TelemetrySample]) { self.samples = samples }
}

actor TelemetryHub {
    nonisolated let stationName: String
    private var latest: [String: Double] = [:]

    init(stationName: String) { self.stationName = stationName }

    func record(_ sample: TelemetrySample) {
        latest[sample.label] = sample.value
    }

    func value(for label: String) -> Double? { latest[label] }

    func snapshot() -> [TelemetrySample] {
        latest
            .map { TelemetrySample(label: $0.key, value: $0.value) }
            .sorted { $0.label < $1.label }
    }

    func merge(from other: TelemetryHub) async {
        for sample in await other.snapshot() {
            latest[sample.label] = sample.value
        }
    }

    static func peek(_ hub: isolated TelemetryHub, label: String) -> Double? {
        hub.latest[label]
    }
}

Task {
    let table = CalibrationTable(samples: [TelemetrySample(label: "rpm", value: 3200)])
    print(table.samples)

    let primary = TelemetryHub(stationName: "Bay-A")
    let secondary = TelemetryHub(stationName: "Bay-B")
    print(primary.stationName)

    await secondary.record(TelemetrySample(label: "oil", value: 40))
    await primary.merge(from: secondary)
    print(await primary.value(for: "oil") as Any)
    print(await TelemetryHub.peek(primary, label: "oil") as Any)

    PlaygroundPage.current.finishExecution()
}
