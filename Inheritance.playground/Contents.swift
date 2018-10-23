import UIKit


class Animals{ // base class
    
    func sound(){ // function
        
    }
}


class Dog : Animals{ // base class extended
    
    override func sound() { // function is override
        
        print("bow-wow") // message
    }
}


var dog = Dog() // instance

dog.sound() // call the function


class Cat : Animals{ // extended
    
    override func sound() {
        
        print("meow") // override
    }
}

var cat = Cat() // cat instance

cat.sound() // message



class TurkishDog : Dog{ // extended class
    
    override func sound() {
        
        print("bow-wow-wow")
    }
}
