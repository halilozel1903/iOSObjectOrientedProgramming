import Foundation

/// A comparable score used to demonstrate generic `where` clauses.
public struct Score: Comparable, Sendable, CustomStringConvertible {
    public let value: Int

    public init(_ value: Int) {
        self.value = value
    }

    public static func < (lhs: Score, rhs: Score) -> Bool {
        lhs.value < rhs.value
    }

    public var description: String { "\(value)" }
}

/// Helpers that only compile when the generic parameters satisfy constraints.
public enum Ranking {
    /// Requires `Element` to be `Comparable` so `max` is well defined.
    public static func highest<Element: Comparable>(in values: [Element]) -> Element? {
        values.max()
    }

    /// Constrains both the collection and its element through a `where` clause.
    public static func sortedDescending<S: Sequence>(
        _ values: S
    ) -> [S.Element] where S.Element: Comparable {
        values.sorted(by: >)
    }

    /// Protocol composition constraint: printable and hashable identifiers.
    public static func uniqueLabels<Label: Hashable & CustomStringConvertible>(
        _ labels: [Label]
    ) -> [String] {
        var seen: Set<Label> = []
        var result: [String] = []
        for label in labels where seen.insert(label).inserted {
            result.append(label.description)
        }
        return result
    }
}

/// Primary associated type (`Collection<Score>`) keeps the element type visible.
public enum Scoreboard {
    public static func total(of scores: some Collection<Score>) -> Int {
        scores.reduce(0) { $0 + $1.value }
    }
}
