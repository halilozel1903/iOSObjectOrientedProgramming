import Foundation

/// Codable vehicle passport with custom coding keys and a nested engine record.
public struct VehiclePassport: Codable, Sendable, Equatable {
    public let model: String
    public let year: Int
    public let engine: EngineSpec

    public enum CodingKeys: String, CodingKey {
        case model = "model_name"
        case year = "model_year"
        case engine
    }

    public init(model: String, year: Int, engine: EngineSpec) {
        self.model = model
        self.year = year
        self.engine = engine
    }
}

public struct EngineSpec: Codable, Sendable, Equatable {
    public let horsepower: Int
    public let fuel: FuelKind

    public init(horsepower: Int, fuel: FuelKind) {
        self.horsepower = horsepower
        self.fuel = fuel
    }
}

public enum FuelKind: String, Codable, Sendable, CaseIterable {
    case petrol
    case diesel
    case electric
    case hybrid
}

/// Round-trips passports through `JSONEncoder` / `JSONDecoder`.
public enum PassportCodec {
    public static func encode(_ passport: VehiclePassport) throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]
        return try encoder.encode(passport)
    }

    public static func decode(from data: Data) throws -> VehiclePassport {
        try JSONDecoder().decode(VehiclePassport.self, from: data)
    }
}
