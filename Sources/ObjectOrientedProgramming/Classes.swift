import Foundation

/// A reference type that introduces the building blocks of a Swift class:
/// stored properties, methods and reference semantics.
public final class Vehicle {
    /// Number of tires a standard passenger car ships with.
    public static let standardTireCount = 4

    public let tires: Int
    public let headlights: Int
    public let horsepower: Int

    /// Mutable state is exposed read-only and changed through methods so the
    /// class keeps control over its own invariants (encapsulation).
    public private(set) var model: String
    public private(set) var speedInKilometersPerHour: Double

    public init(
        model: String,
        horsepower: Int = 468,
        tires: Int = Vehicle.standardTireCount,
        headlights: Int = 2
    ) {
        self.model = model
        self.horsepower = horsepower
        self.tires = tires
        self.headlights = headlights
        self.speedInKilometersPerHour = 0
    }

    public func rename(to newModel: String) {
        model = newModel
    }

    public func drive(increasingSpeedBy increase: Double) {
        speedInKilometersPerHour = max(0, speedInKilometersPerHour + increase)
    }

    public func brake() {
        speedInKilometersPerHour = 0
    }
}

extension Vehicle: CustomStringConvertible {
    public var description: String {
        "\(model) – \(horsepower) hp at \(speedInKilometersPerHour) km/h"
    }
}

/// A value type counterpart of ``Vehicle`` used to contrast value and
/// reference semantics.
public struct Engine: Sendable, Equatable {
    public var displacementInLiters: Double
    public var cylinders: Int

    public init(displacementInLiters: Double, cylinders: Int) {
        self.displacementInLiters = displacementInLiters
        self.cylinders = cylinders
    }
}

/// Helpers that make the difference between passing a class (by reference) and
/// a struct (by value) observable in tests and playgrounds.
public enum Semantics {
    /// Mutates the shared instance: the caller sees the new model.
    public static func rename(_ vehicle: Vehicle, to model: String) {
        vehicle.rename(to: model)
    }

    /// Receives a copy: the caller's engine stays untouched.
    public static func tuned(_ engine: Engine, addingCylinders extra: Int) -> Engine {
        var copy = engine
        copy.cylinders += extra
        return copy
    }
}
