import Testing

@testable import ObjectOrientedProgramming

@Suite("Polymorphism")
struct PolymorphismTests {
    private let shapes: [any Shape] = [
        Triangle(base: 10, height: 4),
        Rectangle(width: 3, height: 5),
        Circle(radius: 1)
    ]

    @Test("Every shape computes its own area")
    func areas() {
        #expect(Triangle(base: 10, height: 4).area == 20)
        #expect(Rectangle(width: 3, height: 5).area == 15)
        #expect(Circle(radius: 2).area.isApproximatelyEqual(to: 12.566_370, tolerance: 0.000_01))
    }

    @Test("Existential collections sum up through the protocol")
    func totalArea() {
        #expect(ShapeGallery.totalArea(of: shapes).isApproximatelyEqual(to: 38.141_592, tolerance: 0.000_01))
    }

    @Test("The largest shape is found regardless of the concrete type")
    func largestShape() {
        #expect(ShapeGallery.largest(of: shapes) is Triangle)
        #expect(ShapeGallery.largest(of: []) == nil)
    }
}

extension Double {
    fileprivate func isApproximatelyEqual(to other: Double, tolerance: Double) -> Bool {
        abs(self - other) <= tolerance
    }
}
