import Foundation
import SwiftData

@Model
final class UserProfile {
    var currentStreak: Int
    var longestStreak: Int
    var lastActiveDate: Date?
    var totalPoints: Int
    var currentTier: Int
    
    @Relationship(deleteRule: .cascade) 
    var taskLogs: [UserTaskLog] = []
    
    init(currentStreak: Int = 0, longestStreak: Int = 0, totalPoints: Int = 0, currentTier: Int = 1) {
        self.currentStreak = currentStreak
        self.longestStreak = longestStreak
        self.totalPoints = totalPoints
        self.currentTier = currentTier
    }
}
