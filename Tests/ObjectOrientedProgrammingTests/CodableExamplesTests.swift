import Foundation
import Testing

@testable import ObjectOrientedProgramming

@Suite("Codable")
struct CodableExamplesTests {
    @Test("Passport round-trips through JSON with custom keys")
    func roundTrip() throws {
        let passport = VehiclePassport(
            model: "4 Series",
            year: 2024,
            engine: EngineSpec(horsepower: 382, fuel: .petrol)
        )

        let data = try PassportCodec.encode(passport)
        let json = try #require(String(data: data, encoding: .utf8))
        #expect(json.contains("\"model_name\":\"4 Series\""))
        #expect(json.contains("\"model_year\":2024"))

        let decoded = try PassportCodec.decode(from: data)
        #expect(decoded == passport)
    }

    @Test("Fuel kinds are string-backed")
    func fuelKinds() {
        #expect(
            FuelKind.allCases.map(\.rawValue) == [
                "petrol",
                "diesel",
                "electric",
                "hybrid",
            ])
    }
}
