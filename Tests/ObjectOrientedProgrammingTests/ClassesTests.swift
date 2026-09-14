import Testing

@testable import ObjectOrientedProgramming

@Suite("Classes and semantics")
struct ClassesTests {
    @Test("A vehicle starts standing still with default hardware")
    func defaults() {
        let vehicle = Vehicle(model: "328i")

        #expect(vehicle.tires == Vehicle.standardTireCount)
        #expect(vehicle.headlights == 2)
        #expect(vehicle.speedInKilometersPerHour == 0)
    }

    @Test("Driving accelerates and braking stops the vehicle")
    func driveAndBrake() {
        let vehicle = Vehicle(model: "F-150")

        vehicle.drive(increasingSpeedBy: 30)
        vehicle.drive(increasingSpeedBy: 20)
        #expect(vehicle.speedInKilometersPerHour == 50)

        vehicle.brake()
        #expect(vehicle.speedInKilometersPerHour == 0)
    }

    @Test("Classes are passed by reference")
    func referenceSemantics() {
        let vehicle = Vehicle(model: "F-150")
        Semantics.rename(vehicle, to: "Apple")

        #expect(vehicle.model == "Apple")
    }

    @Test("Structs are passed by value")
    func valueSemantics() {
        let engine = Engine(displacementInLiters: 3.0, cylinders: 6)
        let tuned = Semantics.tuned(engine, addingCylinders: 2)

        #expect(engine.cylinders == 6)
        #expect(tuned.cylinders == 8)
    }
}
