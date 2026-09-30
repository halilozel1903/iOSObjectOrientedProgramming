import Foundation

struct EngineSpec: Codable {
    let horsepower: Int
    let fuel: String
}

struct VehiclePassport: Codable {
    let model: String
    let year: Int
    let engine: EngineSpec

    enum CodingKeys: String, CodingKey {
        case model = "model_name"
        case year = "model_year"
        case engine
    }
}

let passport = VehiclePassport(
    model: "4 Series",
    year: 2024,
    engine: EngineSpec(horsepower: 382, fuel: "petrol")
)

let encoder = JSONEncoder()
encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
let data = try encoder.encode(passport)
print(String(data: data, encoding: .utf8)!)

let decoded = try JSONDecoder().decode(VehiclePassport.self, from: data)
print(decoded)
