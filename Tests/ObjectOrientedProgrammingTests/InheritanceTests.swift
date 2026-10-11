import Testing

@testable import ObjectOrientedProgramming

@Suite("Inheritance")
struct InheritanceTests {
    @Test("Each subclass overrides the inherited sound")
    func overriddenSounds() {
        #expect(Animal(name: "Unknown").sound() == "...")
        #expect(Dog().sound() == "bow-wow")
        #expect(Cat().sound() == "meow")
        #expect(GuardDog().sound() == "bow-wow-wow")
    }

    @Test("A subclass initializer can customize inherited state")
    func customInitializer() {
        #expect(Dog(name: "Buddy", isPuppy: true).name == "Buddy (puppy)")
    }

    @Test("Dynamic dispatch picks the subclass implementation")
    func dynamicDispatch() {
        let animals: [Animal] = [Dog(), Cat(), GuardDog()]

        #expect(animals.map { $0.sound() } == ["bow-wow", "meow", "bow-wow-wow"])
    }

    @Test("Subclasses accelerate with their own factor")
    func vehicleHierarchy() {
        let car = SportsCar()
        let truck = Truck()

        car.drive(increasingSpeedBy: 10)
        truck.drive(increasingSpeedBy: 20)

        #expect(car.speedInKilometersPerHour == 40)
        #expect(truck.speedInKilometersPerHour == 20)
        #expect(truck.tires == 6)

        car.brake()
        #expect(car.speedInKilometersPerHour == 0)
    }
}
