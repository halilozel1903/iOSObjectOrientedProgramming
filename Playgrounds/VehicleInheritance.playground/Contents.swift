import Foundation

// MARK: - Base class with shared state

class MotorVehicle: CustomStringConvertible {
    let tires: Int
    let make: String
    let model: String
    private(set) var speedInKilometersPerHour: Double = 0

    init(make: String, model: String, tires: Int = 4) {
        self.make = make
        self.model = model
        self.tires = tires
    }

    /// Subclasses override this property instead of duplicating the maths.
    var accelerationFactor: Double { 2 }

    final func drive(increasingSpeedBy increase: Double) {
        speedInKilometersPerHour += increase * accelerationFactor
    }

    final func brake() {
        speedInKilometersPerHour = 0
    }

    var description: String {
        "\(make) \(model) at \(speedInKilometersPerHour) km/h"
    }
}

// MARK: - Subclasses

final class SportsCar: MotorVehicle {
    init() {
        super.init(make: "BMW", model: "4 Series")
    }

    override var accelerationFactor: Double { 4 }
}

final class Truck: MotorVehicle {
    init() {
        super.init(make: "Ford", model: "F-Max", tires: 6)
    }

    override var accelerationFactor: Double { 1 }
}

let car = SportsCar()
car.drive(increasingSpeedBy: 10)
print(car) // 40 km/h

let truck = Truck()
truck.drive(increasingSpeedBy: 20)
print(truck) // 20 km/h

car.brake()
truck.brake()
