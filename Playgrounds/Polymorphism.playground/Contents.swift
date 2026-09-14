import Foundation

// MARK: - Polymorphism through a protocol

protocol Shape: CustomStringConvertible {
    var area: Double { get }
}

extension Shape {
    var description: String { "\(Self.self)(area: \(area))" }
}

struct Triangle: Shape {
    var base: Double
    var height: Double

    var area: Double { (base * height) / 2 }
}

struct Rectangle: Shape {
    var width: Double
    var height: Double

    var area: Double { width * height }
}

struct Circle: Shape {
    var radius: Double

    var area: Double { .pi * radius * radius }
}

// MARK: - The call site only depends on the abstraction

let shapes: [any Shape] = [
    Triangle(base: 10, height: 4),
    Rectangle(width: 3, height: 5),
    Circle(radius: 1),
]

for shape in shapes {
    print(shape)
}

let totalArea = shapes.reduce(0) { $0 + $1.area }
print("Total area: \(totalArea)")

if let largest = shapes.max(by: { $0.area < $1.area }) {
    print("Largest shape: \(largest)")
}
