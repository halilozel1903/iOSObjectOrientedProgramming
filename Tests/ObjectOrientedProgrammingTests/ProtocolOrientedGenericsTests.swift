import Testing

@testable import ObjectOrientedProgramming

@Suite("Protocol-oriented generics")
struct ProtocolOrientedGenericsTests {
    @Test("PartBin stores associated-type items")
    func partBinStoresItems() {
        var bin = PartBin()
        bin.store("filter")
        bin.store("gasket")

        #expect(bin.items == ["filter", "gasket"])
        #expect(InventoryClerk.count(of: bin) == 2)
        #expect(InventoryClerk.contains("gasket", in: bin))
        #expect(!InventoryClerk.contains("rotor", in: bin))
    }

    @Test("Opaque some Inventory hides the concrete type")
    func seededOpaqueInventory() {
        let stock = InventoryClerk.seededBin(with: ["bolt", "nut"])
        #expect(InventoryClerk.count(of: stock) == 2)
        #expect(InventoryClerk.contains("bolt", in: stock))
    }
}
