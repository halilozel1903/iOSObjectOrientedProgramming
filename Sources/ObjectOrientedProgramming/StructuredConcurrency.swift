import Foundation

/// Work item processed by structured concurrency helpers.
public struct WorkItem: Sendable, Equatable {
    public let id: Int
    public let payload: String

    public init(id: Int, payload: String) {
        self.id = id
        self.payload = payload
    }
}

public struct WorkResult: Sendable, Equatable {
    public let id: Int
    public let summary: String

    public init(id: Int, summary: String) {
        self.id = id
        self.summary = summary
    }
}

/// Structured concurrency patterns beyond a single actor: `async let`,
/// task groups and an `AsyncSequence` pipeline.
public enum WorkPipeline {
    /// Fan-out with a task group; results come back in completion order and
    /// are sorted afterwards for determinism.
    public static func processAll(_ items: [WorkItem]) async -> [WorkResult] {
        await withTaskGroup(of: WorkResult.self) { group in
            for item in items {
                group.addTask {
                    WorkResult(id: item.id, summary: item.payload.uppercased())
                }
            }

            var results: [WorkResult] = []
            for await result in group {
                results.append(result)
            }
            return results.sorted { $0.id < $1.id }
        }
    }

    /// Sibling tasks started with `async let` that run concurrently and join.
    public static func summarizePair(_ first: WorkItem, _ second: WorkItem) async -> String {
        async let left = decorate(first)
        async let right = decorate(second)
        return await "\(left) | \(right)"
    }

    /// Turns a snapshot into an async sequence for incremental consumption.
    public static func stream(_ items: [WorkItem]) -> AsyncStream<WorkItem> {
        AsyncStream { continuation in
            for item in items {
                continuation.yield(item)
            }
            continuation.finish()
        }
    }

    public static func collect(_ stream: AsyncStream<WorkItem>) async -> [WorkItem] {
        var collected: [WorkItem] = []
        for await item in stream {
            collected.append(item)
        }
        return collected
    }

    private static func decorate(_ item: WorkItem) async -> String {
        "#\(item.id):\(item.payload)"
    }
}
