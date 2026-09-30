import Foundation

/// Protocol-oriented design with an associated type: clients depend on the
/// abstraction, while each conforming type picks its own `Item`.
public protocol Inventory: Sendable {
    associatedtype Item: Sendable & Equatable

    var items: [Item] { get }
    mutating func store(_ item: Item)
}

/// A concrete inventory whose associated type is inferred as `String`.
public struct PartBin: Inventory {
    public private(set) var items: [String] = []

    public init() {}

    public mutating func store(_ item: String) {
        items.append(item)
    }
}

/// Generic helper constrained to any `Inventory`. The associated type stays
/// opaque at the call site through the `some Inventory` return / parameter.
public enum InventoryClerk {
    public static func count<Stock: Inventory>(of stock: Stock) -> Int {
        stock.items.count
    }

    public static func contains<Stock: Inventory>(_ item: Stock.Item, in stock: Stock) -> Bool {
        stock.items.contains(item)
    }

    /// Returns a fresh bin already holding the supplied parts.
    public static func seededBin(with parts: [String]) -> some Inventory {
        var bin = PartBin()
        for part in parts {
            bin.store(part)
        }
        return bin
    }
}
