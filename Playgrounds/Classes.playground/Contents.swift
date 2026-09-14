import Foundation

// MARK: - Classes are reference types

final class Vehicle {
    let tires = 4
    let headlights = 2
    let horsepower = 468

    private(set) var model: String
    private(set) var speedInKilometersPerHour: Double = 0

    init(model: String) {
        self.model = model
    }

    func rename(to newModel: String) {
        model = newModel
    }

    func drive(increasingSpeedBy increase: Double) {
        speedInKilometersPerHour += increase
    }

    func brake() {
        speedInKilometersPerHour = 0
    }
}

let bmw = Vehicle(model: "328i")
let ford = Vehicle(model: "F-150")

ford.drive(increasingSpeedBy: 50)
print("\(ford.model) is driving at \(ford.speedInKilometersPerHour) km/h")
ford.brake()

// MARK: - Passing a class hands over a reference

func rename(_ vehicle: Vehicle, to model: String) {
    vehicle.rename(to: model)
}

print(ford.model)
rename(ford, to: "Apple")
print(ford.model) // the original instance changed

// MARK: - Passing a struct hands over a copy

struct Engine {
    var displacementInLiters: Double
    var cylinders: Int
}

func tuned(_ engine: Engine, addingCylinders extra: Int) -> Engine {
    var copy = engine
    copy.cylinders += extra
    return copy
}

let engine = Engine(displacementInLiters: 3.0, cylinders: 6)
let tunedEngine = tuned(engine, addingCylinders: 2)

print(engine.cylinders) // 6 – untouched
print(tunedEngine.cylinders) // 8
print(bmw.model)
