import Foundation

// Freestanding compiler macros expand at the call site.
struct SourceLocation: CustomStringConvertible {
    let fileID: String
    let function: String
    let line: Int
    let column: Int

    init(
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

    var description: String { "\(fileID):\(line):\(column) in \(function)" }
}

func breadcrumb(_ message: String, location: SourceLocation = SourceLocation()) {
    print("[\(location)] \(message)")
}

breadcrumb("playground started")
breadcrumb("ready for inspection")
