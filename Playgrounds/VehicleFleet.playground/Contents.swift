import Foundation
import PlaygroundSupport

// MARK: - Actors protect mutable reference state

struct FleetEntry: Sendable, Equatable {
    let model: String
    let speedInKilometersPerHour: Double
}

actor VehicleFleet {
    private var speeds: [String: Double] = [:]

    func record(model: String, speedInKilometersPerHour speed: Double) {
        speeds[model] = speed
    }

    var entries: [FleetEntry] {
        speeds
            .map { FleetEntry(model: $0.key, speedInKilometersPerHour: $0.value) }
            .sorted { $0.model < $1.model }
    }

    var fastest: FleetEntry? {
        entries.max { $0.speedInKilometersPerHour < $1.speedInKilometersPerHour }
    }
}

// MARK: - Many tasks write concurrently, the actor serializes them

PlaygroundPage.current.needsIndefiniteExecution = true

Task {
    let fleet = VehicleFleet()

    await withTaskGroup(of: Void.self) { group in
        for (model, speed) in ["4 Series": 240.0, "F-Max": 120.0, "328i": 210.0] {
            group.addTask {
                await fleet.record(model: model, speedInKilometersPerHour: speed)
            }
        }
    }

    for entry in await fleet.entries {
        print("\(entry.model): \(entry.speedInKilometersPerHour) km/h")
    }

    if let fastest = await fleet.fastest {
        print("Fastest: \(fastest.model)")
    }

    PlaygroundPage.current.finishExecution()
}
