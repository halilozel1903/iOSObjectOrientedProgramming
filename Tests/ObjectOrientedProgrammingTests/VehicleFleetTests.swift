import Testing

@testable import ObjectOrientedProgramming

@Suite("Actor based state")
struct VehicleFleetTests {
    @Test("Recorded speeds are readable again")
    func recording() async {
        let fleet = VehicleFleet()
        await fleet.record(model: "4 Series", speedInKilometersPerHour: 240)

        #expect(await fleet.speed(of: "4 Series") == 240)
        #expect(await fleet.speed(of: "F-Max") == nil)
    }

    @Test("Concurrent writers cannot corrupt the actor state")
    func concurrentWrites() async {
        let fleet = VehicleFleet()

        await withTaskGroup(of: Void.self) { group in
            for index in 0..<100 {
                group.addTask {
                    await fleet.record(model: "Car \(index)", speedInKilometersPerHour: Double(index))
                }
            }
        }

        let entries = await fleet.entries
        #expect(entries.count == 100)
        #expect(await fleet.fastest == FleetEntry(model: "Car 99", speedInKilometersPerHour: 99))
    }
}
