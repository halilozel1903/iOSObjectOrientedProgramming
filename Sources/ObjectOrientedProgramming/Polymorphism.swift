import Foundation

/// Protocol-oriented polymorphism: every shape computes its own area and the
/// call site only depends on the abstraction.
public protocol Shape: Sendable, CustomStringConvertible {
    var area: Double { get }
}

extension Shape {
    public var description: String {
        "\(Self.self)(area: \(area))"
    }
}

public struct Triangle: Shape {
    public var base: Double
    public var height: Double

    public init(base: Double, height: Double) {
        self.base = base
        self.height = height
    }

    public var area: Double { (base * height) / 2 }
}

public struct Rectangle: Shape {
    public var width: Double
    public var height: Double

    public init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    public var area: Double { width * height }
}

public struct Circle: Shape {
    public var radius: Double

    public init(radius: Double) {
        self.radius = radius
    }

    public var area: Double { .pi * radius * radius }
}

/// Works with any mix of shapes thanks to the existential `any Shape` type.
public enum ShapeGallery {
    public static func totalArea(of shapes: [any Shape]) -> Double {
        shapes.reduce(0) { $0 + $1.area }
    }

    public static func largest(of shapes: [any Shape]) -> (any Shape)? {
        shapes.max { $0.area < $1.area }
    }
}
