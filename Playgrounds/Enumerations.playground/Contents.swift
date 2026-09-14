import Foundation

// MARK: - Enumerations

enum CarType: String, CaseIterable, CustomStringConvertible {
    case sedan
    case coupe
    case hatchback

    var description: String { rawValue.capitalized }

    var typicalNumberOfDoors: Int {
        switch self {
        case .sedan: 4
        case .coupe: 2
        case .hatchback: 5
        }
    }
}

for type in CarType.allCases {
    print("\(type) usually has \(type.typicalNumberOfDoors) doors")
}

// MARK: - Designated and convenience initializers

final class Car: CustomStringConvertible {
    private(set) var colour: String
    private(set) var numberOfSeats: Int
    private(set) var type: CarType

    /// Designated initializer: initializes every stored property.
    init(colour: String = "black", numberOfSeats: Int = 5, type: CarType = .hatchback) {
        self.colour = colour
        self.numberOfSeats = numberOfSeats
        self.type = type
    }

    /// Convenience initializers are secondary initializers that must delegate
    /// to a designated initializer of the same class.
    convenience init(customerChosenColour colour: String) {
        self.init()
        self.colour = colour
    }

    var description: String {
        "\(colour) \(type) with \(numberOfSeats) seats"
    }
}

let myCar = Car()
print(myCar)

let someCar = Car(customerChosenColour: "Gold")
print(someCar)
print(someCar.type.typicalNumberOfDoors)
