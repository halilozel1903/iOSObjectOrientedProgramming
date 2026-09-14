import Foundation

/// Base class of the animal hierarchy. Subclasses override ``sound()`` to
/// provide their own behaviour instead of printing from the base class, which
/// keeps the example testable.
open class Animal {
    public let name: String

    public init(name: String) {
        self.name = name
    }

    open func sound() -> String {
        "..."
    }
}

open class Dog: Animal {
    public init() {
        super.init(name: "Dog")
    }

    public init(name: String, isPuppy: Bool) {
        super.init(name: isPuppy ? "\(name) (puppy)" : name)
    }

    override open func sound() -> String {
        "bow-wow"
    }
}

public final class Cat: Animal {
    public init() {
        super.init(name: "Cat")
    }

    override public func sound() -> String {
        "meow"
    }
}

/// Two levels of inheritance: `TurkishDog` inherits from `Dog`, which itself
/// inherits from `Animal`.
public final class TurkishDog: Dog {
    override public func sound() -> String {
        "bow-wow-wow"
    }
}
