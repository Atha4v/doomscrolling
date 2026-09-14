import Foundation
import SwiftData

@Model
final class UserTaskLog {
    @Attribute(.unique) var id: UUID
    var assignedAt: Date
    var completedAt: Date?
    var statusRaw: String
    
    var task: TaskItem?
    var userProfile: UserProfile?
    
    init(task: TaskItem?, statusRaw: String = "pending") {
        self.id = UUID()
        self.assignedAt = Date()
        self.statusRaw = statusRaw
        self.task = task
    }
}
