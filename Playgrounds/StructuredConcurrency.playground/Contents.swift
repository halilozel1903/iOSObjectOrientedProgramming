import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct WorkItem: Sendable {
    let id: Int
    let payload: String
}

Task {
    let items = [
        WorkItem(id: 1, payload: "oil"),
        WorkItem(id: 2, payload: "brakes"),
    ]

    let processed = await withTaskGroup(of: String.self) { group in
        for item in items {
            group.addTask { "#\(item.id):\(item.payload.uppercased())" }
        }
        var rows: [String] = []
        for await row in group { rows.append(row) }
        return rows.sorted()
    }
    print(processed)

    async let left = "A"
    async let right = "B"
    print(await "\(left)|\(right)")

    PlaygroundPage.current.finishExecution()
}
