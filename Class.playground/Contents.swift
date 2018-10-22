import UIKit

// class name
class Vehicle {
    
    // variables
    var tires = 4
    var headlights = 2
    var horsepower = 468
    var model = ""
    
    
    // accelerate the vehicle
    func drive(){
        
        
    }
    
    // func create
    func brake(){
        
    }
}

// new object
let bmw = Vehicle()
bmw.model = "328i"

let ford = Vehicle()
ford.model = "f150"
ford.brake()

// func use
func passByReference(vehicle: Vehicle){
    vehicle.model = "Apple"
}

print(ford.model)

passByReference(vehicle: ford) // pass by reference

print(ford.model)

var someonesAge = 20

// pass by value
func passByValue(age:Int){
    
    let newAge = age
}

passByValue(age: someonesAge)


