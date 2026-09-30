import Foundation

@propertyWrapper
struct Clamped<Value: Comparable> {
    var wrappedValue: Value {
        didSet { wrappedValue = Self.clamp(wrappedValue, to: range) }
    }

    var projectedValue: ClosedRange<Value> { range }
    private let range: ClosedRange<Value>

    init(wrappedValue: Value, _ range: ClosedRange<Value>) {
        self.range = range
        self.wrappedValue = Self.clamp(wrappedValue, to: range)
    }

    private static func clamp(_ value: Value, to range: ClosedRange<Value>) -> Value {
        min(max(value, range.lowerBound), range.upperBound)
    }
}

struct LimitedVehicle {
    var model: String
    @Clamped(0...120) var speedInKilometersPerHour: Double
}

var car = LimitedVehicle(model: "328i", speedInKilometersPerHour: -5)
print(car.speedInKilometersPerHour) // 0
car.speedInKilometersPerHour = 200
print(car.speedInKilometersPerHour) // 120
print(car.$speedInKilometersPerHour)
