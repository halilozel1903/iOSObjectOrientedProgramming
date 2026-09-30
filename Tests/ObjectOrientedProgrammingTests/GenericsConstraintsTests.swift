import Testing

@testable import ObjectOrientedProgramming

@Suite("Generics constraints")
struct GenericsConstraintsTests {
    @Test("Comparable constraint finds the highest value")
    func highestScore() {
        let scores = [Score(3), Score(9), Score(5)]
        #expect(Ranking.highest(in: scores) == Score(9))
        #expect(Ranking.highest(in: [Int]()) == nil)
    }

    @Test("where clause sorts descending")
    func sortedDescending() {
        #expect(Ranking.sortedDescending([1, 4, 2]) == [4, 2, 1])
    }

    @Test("Protocol composition keeps unique labels")
    func uniqueLabels() {
        #expect(Ranking.uniqueLabels(["a", "b", "a", "c"]) == ["a", "b", "c"])
    }

    @Test("Primary associated type sums a score collection")
    func scoreboardTotal() {
        #expect(Scoreboard.total(of: [Score(2), Score(3), Score(5)]) == 10)
    }
}
