import Foundation

/// Domain errors for garage operations. Conforms to `Error` and `Sendable`
/// so it can cross concurrency domains safely.
public enum GarageError: Error, Sendable, Equatable, CustomStringConvertible {
    case emptyModel
    case unsupportedService(String)
    case capacityReached(limit: Int)

    public var description: String {
        switch self {
        case .emptyModel:
            "Vehicle model must not be empty"
        case .unsupportedService(let name):
            "Unsupported service: \(name)"
        case .capacityReached(let limit):
            "Bay capacity reached (limit \(limit))"
        }
    }
}

/// Service request that validates input and reports failure with typed throws.
public struct ServiceTicket: Sendable, Equatable {
    public let model: String
    public let service: String

    public init(model: String, service: String) throws(GarageError) {
        guard !model.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            throw .emptyModel
        }
        let allowed = Set(["oil-change", "inspection", "brake-check"])
        guard allowed.contains(service) else {
            throw .unsupportedService(service)
        }
        self.model = model
        self.service = service
    }
}

/// Schedules tickets into a fixed number of bays and surfaces overflow as an error.
public struct ServiceBay: Sendable {
    public let capacity: Int
    public private(set) var tickets: [ServiceTicket] = []

    public init(capacity: Int) {
        self.capacity = capacity
    }

    public mutating func schedule(_ ticket: ServiceTicket) throws(GarageError) {
        guard tickets.count < capacity else {
            throw .capacityReached(limit: capacity)
        }
        tickets.append(ticket)
    }

    /// `Result` based API for call sites that prefer values over `try`.
    public mutating func trySchedule(_ ticket: ServiceTicket) -> Result<Int, GarageError> {
        do throws(GarageError) {
            try schedule(ticket)
            return .success(tickets.count)
        } catch {
            return .failure(error)
        }
    }
}
