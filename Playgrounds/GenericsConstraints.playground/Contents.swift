import Foundation

struct Score: Comparable, CustomStringConvertible {
    let value: Int
    static func < (lhs: Score, rhs: Score) -> Bool { lhs.value < rhs.value }
    var description: String { "\(value)" }
}

func highest<Element: Comparable>(in values: [Element]) -> Element? {
    values.max()
}

func sortedDescending<S: Sequence>(_ values: S) -> [S.Element] where S.Element: Comparable {
    values.sorted(by: >)
}

func total(of scores: some Collection<Score>) -> Int {
    scores.reduce(0) { $0 + $1.value }
}

let scores = [Score(3), Score(9), Score(5)]
print(highest(in: scores) as Any)
print(sortedDescending([1, 4, 2]))
print(total(of: scores))
