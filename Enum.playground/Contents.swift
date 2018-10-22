import UIKit

// enum declaration
enum CarType{
    
    case Sedan
    case Coupe
    case Hatchback
}

// class declaration
class Car{
    
    var colour = "" // string type
    var numberOfSeats = 5 // int type
    var typeOfCar : CarType = .Hatchback // enum type
    
    // initilization
    init(customerChosenColour : String) {
        
        colour = customerChosenColour
    }
}


let myCar = Car(customerChosenColour: "blue") // Car's object - blueprint , colour value

print(myCar.colour) // colour value
print(myCar.numberOfSeats) // numberOfSeats value
print(myCar.typeOfCar) // typeOfCar value



