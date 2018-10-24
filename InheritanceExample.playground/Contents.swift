import UIKit


class Vehicle{ // baseClass
    
    var tires = 4
    var make : String?
    var model : String?
    var currentSpeed: Double = 0
    
    init() {
        
        print("I'm the parent")
    }
    
    func drive(speedIncrease: Double){
        currentSpeed += speedIncrease * 2
    }
    
    func brake(){
        
    
    }
}

class SportsCar : Vehicle{ // subClass
    
    override init() {
        super.init()
        print("I'm the child")
        make = "BMW"
        model = "4 series"
    }
    
    override func drive(speedIncrease: Double) {
        currentSpeed += speedIncrease * 4
    }
}

class Truck : Vehicle{ // extended - inheritance
    
    override init() { // override
        super.init()
    }
    
    override func drive(speedIncrease: Double) {
        currentSpeed += speedIncrease
    }
}

let car = SportsCar() // subjcet
car.drive(speedIncrease: 10)
car.brake()

let truck = Truck()
truck.drive(speedIncrease: 20)
truck.brake()
