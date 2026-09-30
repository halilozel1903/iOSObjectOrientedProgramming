import Testing

@testable import ObjectOrientedProgramming

@Suite("Result builders")
struct ResultBuildersTests {
    @Test("Menu DSL expands conditionals and loops")
    func garageMenu() {
        let vip = GarageMenu.make(includeDetailing: true, vipCustomer: true)
        #expect(
            vip.map(\.title) == [
                "Oil change",
                "Tire rotation",
                "Interior detailing",
                "Complimentary wash",
                "Ceramic coat",
                "Paint protection",
            ])
        #expect(vip.allSatisfy { $0.isEnabled })

        let basic = GarageMenu.make(includeDetailing: false, vipCustomer: false)
        #expect(
            basic.map(\.title) == [
                "Oil change",
                "Tire rotation",
                "Wash",
                "Ceramic coat",
                "Paint protection",
            ])
        #expect(basic.first { $0.title == "Wash" }?.isEnabled == false)
    }
}
