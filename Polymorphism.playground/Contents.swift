import UIKit


class Shape{ // base class
    
    var area : Double? // variable
    
    func calculateArea(valueA : Double, valueB: Double){
        
    }
}


class Triangle : Shape{ // extended - inheritance - sub class
    
    override func calculateArea(valueA: Double, valueB: Double) {
        area = (valueA * valueB) / 2
    }
    
}


class Rectangle : Shape{
    
    // polymorphism - function
    override func calculateArea(valueA: Double, valueB: Double) {
        area = valueA * valueB
    }
    
}

