import UIKit

// enum declaration
enum CarType{
    
    case Sedan
    case Coupe
    case Hatchback
}

// class declaration
class Car{
    
    var colour = "black" // string type
    var numberOfSeats = 5 // int type
    var typeOfCar : CarType = .Hatchback // enum type
    
    init() {
        // statements
    }
    
    // initilization
   convenience init(customerChosenColour : String) {
        self.init()
        colour = customerChosenColour
    }
}

/*
 
Convenience initializers are secondary, supporting initializers for a class.
 You can define a convenience initializer to call a designated initializer from the same class as the convenience initializer with some of the designated initializer’s parameters set to default values. You can also define a convenience initializer to create an instance of that class for a specific use case or input value type.
 
 */


let myCar = Car() // Car's object - blueprint , colour value

print(myCar.colour) // colour value
print(myCar.numberOfSeats) // numberOfSeats value
print(myCar.typeOfCar) // typeOfCar value


let someCar = Car(customerChosenColour: "Gold")

print(someCar.colour) // colour value
print(someCar.numberOfSeats) // numberOfSeats value
print(someCar.typeOfCar) // typeOfCar value


