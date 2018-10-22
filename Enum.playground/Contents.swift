import UIKit

// enum declaration
enum CarType{
    
    case Sedan
    case Coupe
    case Hatchback
}

// class declaration
class Car{
    
    var colour = "Red" // string type
    var numberOfSeats = 5 // int type
    var typeOfCar : CarType = .Hatchback // enum type
}


let myCar = Car() // Car's object - blueprint

print(myCar.colour) // colour value
print(myCar.numberOfSeats) // numberOfSeats value
print(myCar.typeOfCar) // typeOfCar value
