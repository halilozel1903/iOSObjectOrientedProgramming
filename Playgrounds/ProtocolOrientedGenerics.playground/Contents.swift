import Foundation

// MARK: - Associated types keep protocols flexible

protocol Inventory {
    associatedtype Item: Equatable
    var items: [Item] { get }
    mutating func store(_ item: Item)
}

struct PartBin: Inventory {
    private(set) var items: [String] = []

    mutating func store(_ item: String) {
        items.append(item)
    }
}

func count<Stock: Inventory>(of stock: Stock) -> Int {
    stock.items.count
}

var bin = PartBin()
bin.store("filter")
bin.store("gasket")
print(count(of: bin), bin.items)
