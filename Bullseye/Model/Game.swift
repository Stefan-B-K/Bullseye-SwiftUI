
import SwiftUI

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 45, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 22, date: Date()))
        }
    }
    
    func points(sliderValue: Int) -> Int {
        let delta = abs(sliderValue - target)
        let bonus: Int
        if delta == 0 {
            bonus = 100
        } else if delta <= 2 {
            bonus = 50
        } else {
            bonus = 0
        }
        return  100 - delta + bonus
    }
    
    mutating func startNewRound(points: Int){
        score += points
        round += 1
        target = Int.random(in: 1...100)
        addToLeaderboard(points: points)
    }
    
    mutating func reset() {
        target = Int.random(in: 1...100)
        score = 0
        round = 1
    }
    
    mutating func addToLeaderboard(points: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
}
