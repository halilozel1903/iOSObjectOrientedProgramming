import Foundation

enum GarageError: Error, CustomStringConvertible {
    case emptyModel
    case unsupportedService(String)
    case capacityReached(limit: Int)

    var description: String {
        switch self {
        case .emptyModel: "Vehicle model must not be empty"
        case .unsupportedService(let name): "Unsupported service: \(name)"
        case .capacityReached(let limit): "Bay capacity reached (limit \(limit))"
        }
    }
}

struct ServiceTicket {
    let model: String
    let service: String

    init(model: String, service: String) throws(GarageError) {
        guard !model.isEmpty else { throw .emptyModel }
        guard ["oil-change", "inspection"].contains(service) else {
            throw .unsupportedService(service)
        }
        self.model = model
        self.service = service
    }
}

do throws(GarageError) {
    let ticket = try ServiceTicket(model: "4 Series", service: "oil-change")
    print(ticket)
    _ = try ServiceTicket(model: "M3", service: "nitrous")
} catch {
    print(error)
}
