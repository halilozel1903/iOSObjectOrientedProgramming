import Testing

@testable import ObjectOrientedProgramming

@Suite("Sendable and isolation")
struct SendableIsolationTests {
    @Test("Unchecked Sendable table reads immutable samples")
    func calibrationTable() {
        let table = CalibrationTable(samples: [
            TelemetrySample(label: "rpm", value: 3200),
            TelemetrySample(label: "temp", value: 90),
        ])
        #expect(table.value(for: "rpm") == 3200)
        #expect(table.value(for: "boost") == nil)
    }

    @Test("TelemetryHub records and exposes a nonisolated name")
    func hubRecording() async {
        let hub = TelemetryHub(stationName: "Bay-A")
        #expect(hub.stationName == "Bay-A")

        await hub.record(TelemetrySample(label: "rpm", value: 2100))
        #expect(await hub.value(for: "rpm") == 2100)
        #expect(await hub.snapshot() == [TelemetrySample(label: "rpm", value: 2100)])
    }

    @Test("Async merge copies samples across hubs")
    func asyncMerge() async {
        let primary = TelemetryHub(stationName: "Primary")
        let secondary = TelemetryHub(stationName: "Secondary")

        await secondary.record(TelemetrySample(label: "oil", value: 40))
        await primary.merge(from: secondary)

        #expect(await primary.value(for: "oil") == 40)
    }

    @Test("Isolated parameter peeks without an extra await hop")
    func isolatedPeek() async {
        let hub = TelemetryHub(stationName: "Bay-C")
        await hub.record(TelemetrySample(label: "boost", value: 1.2))
        let value = await TelemetryHub.peek(hub, label: "boost")
        #expect(value == 1.2)
    }
}
