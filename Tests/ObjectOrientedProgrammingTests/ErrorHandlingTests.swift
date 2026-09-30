import Testing

@testable import ObjectOrientedProgramming

@Suite("Error handling")
struct ErrorHandlingTests {
    @Test("Valid tickets are created")
    func validTicket() throws {
        let ticket = try ServiceTicket(model: "4 Series", service: "oil-change")
        #expect(ticket.model == "4 Series")
        #expect(ticket.service == "oil-change")
    }

    @Test("Empty model throws a typed error")
    func emptyModel() {
        #expect(throws: GarageError.emptyModel) {
            try ServiceTicket(model: "  ", service: "oil-change")
        }
    }

    @Test("Unsupported service throws")
    func unsupportedService() {
        #expect(throws: GarageError.unsupportedService("nitrous")) {
            try ServiceTicket(model: "M3", service: "nitrous")
        }
    }

    @Test("Bay capacity is enforced with Result and throws")
    func bayCapacity() throws {
        var bay = ServiceBay(capacity: 1)
        let first = try ServiceTicket(model: "328i", service: "inspection")
        let second = try ServiceTicket(model: "M3", service: "brake-check")

        #expect(throws: GarageError.capacityReached(limit: 1)) {
            try bay.schedule(first)
            try bay.schedule(second)
        }

        var other = ServiceBay(capacity: 1)
        #expect(other.trySchedule(first) == .success(1))
        #expect(other.trySchedule(second) == .failure(.capacityReached(limit: 1)))
    }
}
