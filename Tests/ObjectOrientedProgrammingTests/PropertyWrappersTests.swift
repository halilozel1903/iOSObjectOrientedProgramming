import Testing

@testable import ObjectOrientedProgramming

@Suite("Property wrappers")
struct PropertyWrappersTests {
    @Test("Clamped wrapper keeps values inside the range")
    func clampsAssignments() {
        var vehicle = LimitedVehicle(model: "328i", speedInKilometersPerHour: -10)
        #expect(vehicle.speedInKilometersPerHour == 0)

        vehicle.speedInKilometersPerHour = 80
        #expect(vehicle.speedInKilometersPerHour == 80)

        vehicle.speedInKilometersPerHour = 999
        #expect(vehicle.speedInKilometersPerHour == 120)
    }

    @Test("Projected value exposes the allowed range")
    func projectedRange() {
        let vehicle = LimitedVehicle(model: "F-Max")
        #expect(vehicle.allowedSpeedRange == 0...120)
        #expect(vehicle.$speedInKilometersPerHour == 0...120)
    }
}
