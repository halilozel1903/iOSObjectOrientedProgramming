import Testing

@testable import ObjectOrientedProgramming

@Suite("Macros")
struct MacrosTests {
    @Test("SourceLocation captures macro-expanded call site metadata")
    func sourceLocationDefaults() {
        let location = SourceLocation()
        #expect(location.fileID.contains("MacrosTests.swift"))
        #expect(location.function.contains("sourceLocationDefaults"))
        #expect(location.line > 0)
        #expect(location.column > 0)
        #expect(location.description.contains("MacrosTests.swift"))
    }

    @Test("Tracer records messages with locations")
    func tracerRecordsEvents() {
        var tracer = Tracer()
        tracer.trace("warmup")
        tracer.trace("ready")

        #expect(tracer.events.count == 2)
        #expect(tracer.events[0].message == "warmup")
        #expect(tracer.events[1].message == "ready")
        #expect(tracer.events[0].location.fileID.contains("MacrosTests.swift"))
    }
}
