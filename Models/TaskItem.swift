import Foundation
import SwiftData

@Model
final class TaskItem {
    @Attribute(.unique) var id: UUID
    var title: String
    var taskDescription: String
    var categoryRaw: String
    var requiredTier: Int
    var pointsReward: Int
    
    init(title: String, taskDescription: String, categoryRaw: String, requiredTier: Int, pointsReward: Int) {
        self.id = UUID()
        self.title = title
        self.taskDescription = taskDescription
        self.categoryRaw = categoryRaw
        self.requiredTier = requiredTier
        self.pointsReward = pointsReward
    }
}
