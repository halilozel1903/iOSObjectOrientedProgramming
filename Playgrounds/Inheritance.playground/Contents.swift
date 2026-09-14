import Foundation

// MARK: - Base class

class Animal {
    let name: String

    init(name: String) {
        self.name = name
    }

    func sound() -> String {
        "..."
    }
}

// MARK: - Subclasses override the inherited behaviour

class Dog: Animal {
    init() {
        super.init(name: "Dog")
    }

    override func sound() -> String {
        "bow-wow"
    }
}

final class Cat: Animal {
    init() {
        super.init(name: "Cat")
    }

    override func sound() -> String {
        "meow"
    }
}

/// Two levels of inheritance: `Animal` → `Dog` → `TurkishDog`.
final class TurkishDog: Dog {
    override func sound() -> String {
        "bow-wow-wow"
    }
}

// MARK: - Dynamic dispatch

let animals: [Animal] = [Dog(), Cat(), TurkishDog()]

for animal in animals {
    print("\(animal.name): \(animal.sound())")
}
