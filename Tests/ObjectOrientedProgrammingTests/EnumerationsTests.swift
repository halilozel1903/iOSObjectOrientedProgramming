import Testing

@testable import ObjectOrientedProgramming

@Suite("Enumerations and initializers")
struct EnumerationsTests {
    @Test("Every car type is enumerable")
    func allCases() {
        #expect(CarType.allCases == [.sedan, .coupe, .hatchback])
    }

    @Test("Door count per car type", arguments: [
        (CarType.sedan, 4),
        (CarType.coupe, 2),
        (CarType.hatchback, 5)
    ])
    func doors(type: CarType, expected: Int) {
        #expect(type.typicalNumberOfDoors == expected)
    }

    @Test("The designated initializer applies the defaults")
    func designatedInitializer() {
        let car = Car()

        #expect(car.colour == "black")
        #expect(car.numberOfSeats == 5)
        #expect(car.type == .hatchback)
    }

    @Test("The convenience initializer only overrides the colour")
    func convenienceInitializer() {
        let car = Car(customerChosenColour: "Gold")

        #expect(car.colour == "Gold")
        #expect(car.numberOfSeats == 5)
        #expect(car.description == "Gold Hatchback with 5 seats")
    }
}
