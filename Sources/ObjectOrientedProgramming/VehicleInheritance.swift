import Foundation

/// Base class of the vehicle hierarchy: shared state lives here, while each
/// subclass decides how fast it accelerates.
open class MotorVehicle {
    public let tires: Int
    public private(set) var make: String
    public private(set) var model: String
    public private(set) var speedInKilometersPerHour: Double

    public init(make: String, model: String, tires: Int = 4) {
        self.make = make
        self.model = model
        self.tires = tires
        self.speedInKilometersPerHour = 0
    }

    /// Acceleration factor applied to every throttle input. Subclasses
    /// override this property instead of duplicating the arithmetic.
    open var accelerationFactor: Double { 2 }

    public final func drive(increasingSpeedBy increase: Double) {
        speedInKilometersPerHour += increase * accelerationFactor
    }

    public final func brake() {
        speedInKilometersPerHour = 0
    }
}

public final class SportsCar: MotorVehicle {
    public init() {
        super.init(make: "BMW", model: "4 Series")
    }

    override public var accelerationFactor: Double { 4 }
}

public final class Truck: MotorVehicle {
    public init() {
        super.init(make: "Ford", model: "F-Max", tires: 6)
    }

    override public var accelerationFactor: Double { 1 }
}
