import Testing

@testable import ObjectOrientedProgramming

@Suite("Structured concurrency")
struct StructuredConcurrencyTests {
    @Test("Task group processes every work item")
    func processAll() async {
        let items = [
            WorkItem(id: 2, payload: "brakes"),
            WorkItem(id: 1, payload: "oil"),
        ]
        let results = await WorkPipeline.processAll(items)
        #expect(
            results == [
                WorkResult(id: 1, summary: "OIL"),
                WorkResult(id: 2, summary: "BRAKES"),
            ])
    }

    @Test("async let joins sibling tasks")
    func summarizePair() async {
        let summary = await WorkPipeline.summarizePair(
            WorkItem(id: 1, payload: "a"),
            WorkItem(id: 2, payload: "b")
        )
        #expect(summary == "#1:a | #2:b")
    }

    @Test("AsyncStream yields every item")
    func streamCollect() async {
        let items = [WorkItem(id: 1, payload: "x"), WorkItem(id: 2, payload: "y")]
        let collected = await WorkPipeline.collect(WorkPipeline.stream(items))
        #expect(collected == items)
    }
}
