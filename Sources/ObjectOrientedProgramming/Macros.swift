import Foundation

/// Captures the call-site location using freestanding compiler macros.
/// Custom attached macros need a compiler plugin; these built-in macros are
/// available everywhere Swift runs and illustrate the same expansion idea.
public struct SourceLocation: Sendable, Equatable, CustomStringConvertible {
    public let fileID: String
    public let function: String
    public let line: Int
    public let column: Int

    public init(
        fileID: String = #fileID,
        function: String = #function,
        line: Int = #line,
        column: Int = #column
    ) {
        self.fileID = fileID
        self.function = function
        self.line = line
        self.column = column
    }

    public var description: String {
        "\(fileID):\(line):\(column) in \(function)"
    }
}

/// Structured breadcrumb that pairs a message with the macro-expanded location.
public struct TraceEvent: Sendable, Equatable, CustomStringConvertible {
    public let message: String
    public let location: SourceLocation

    public init(_ message: String, location: SourceLocation = SourceLocation()) {
        self.message = message
        self.location = location
    }

    public var description: String {
        "[\(location)] \(message)"
    }
}

/// Collects macro-annotated trace events for later inspection in tests.
public struct Tracer: Sendable {
    public private(set) var events: [TraceEvent] = []

    public init() {}

    public mutating func trace(
        _ message: String,
        fileID: String = #fileID,
        function: String = #function,
        line: Int = #line,
        column: Int = #column
    ) {
        let location = SourceLocation(
            fileID: fileID,
            function: function,
            line: line,
            column: column
        )
        events.append(TraceEvent(message, location: location))
    }
}
