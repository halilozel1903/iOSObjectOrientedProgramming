import Foundation

/// Raw-value enumeration with a synthesized `allCases` collection and a
/// human readable description.
public enum CarType: String, CaseIterable, Sendable, CustomStringConvertible {
    case sedan
    case coupe
    case hatchback

    public var description: String { rawValue.capitalized }

    /// Enumerations can carry behaviour, not only cases.
    public var typicalNumberOfDoors: Int {
        switch self {
        case .sedan: 4
        case .coupe: 2
        case .hatchback: 5
        }
    }
}

/// Shows designated and convenience initializers working together.
public final class Car {
    public private(set) var colour: String
    public private(set) var numberOfSeats: Int
    public private(set) var type: CarType

    /// Designated initializer: every stored property gets a value here.
    public init(colour: String = "black", numberOfSeats: Int = 5, type: CarType = .hatchback) {
        self.colour = colour
        self.numberOfSeats = numberOfSeats
        self.type = type
    }

    /// Convenience initializer: delegates to the designated one and only
    /// customizes the colour chosen by the customer.
    public convenience init(customerChosenColour colour: String) {
        self.init()
        self.colour = colour
    }

    public func repaint(_ colour: String) {
        self.colour = colour
    }
}

extension Car: CustomStringConvertible {
    public var description: String {
        "\(colour) \(type) with \(numberOfSeats) seats"
    }
}
