import Foundation

/// Clamps every assignment into an inclusive numeric range. Reading the
/// projected value (`$speed`) returns the current bounds.
@propertyWrapper
public struct Clamped<Value: Comparable>: Sendable where Value: Sendable {
    public var wrappedValue: Value {
        didSet { wrappedValue = Self.clamp(wrappedValue, to: range) }
    }

    public var projectedValue: ClosedRange<Value> { range }

    private let range: ClosedRange<Value>

    public init(wrappedValue: Value, _ range: ClosedRange<Value>) {
        self.range = range
        self.wrappedValue = Self.clamp(wrappedValue, to: range)
    }

    private static func clamp(_ value: Value, to range: ClosedRange<Value>) -> Value {
        min(max(value, range.lowerBound), range.upperBound)
    }
}

/// A tiny vehicle model that keeps its speed inside legal limits via a
/// property wrapper instead of manual guards at every call site.
public struct LimitedVehicle: Sendable, Equatable {
    public var model: String

    @Clamped(0...120)
    public var speedInKilometersPerHour: Double

    public init(model: String, speedInKilometersPerHour: Double = 0) {
        self.model = model
        self._speedInKilometersPerHour = Clamped(wrappedValue: speedInKilometersPerHour, 0...120)
    }

    public var allowedSpeedRange: ClosedRange<Double> { $speedInKilometersPerHour }
}
