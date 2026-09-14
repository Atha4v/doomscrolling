import SwiftUI

struct MissionTask: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let level: Int
    let category: String
}

let mockTasks: [MissionTask] = [
    MissionTask(title: "Hydration Check", description: "Drink a full glass of water right now.", level: 1, category: "Frictionless"),
    MissionTask(title: "Sneaker Refresh", description: "Clean your daily sneakers for tomorrow.", level: 2, category: "Lifestyle"),
    MissionTask(title: "Clean Repo", description: "Commit and push pending code changes.", level: 3, category: "Productivity"),
    MissionTask(title: "Send Gratitude", description: "Text a classmate a quick compliment.", level: 4, category: "Kindness")
]

@Observable
class AppStateManager {
    var currentStreak: Int = 3
    var currentLevel: Int = 1
    var isIntercepted: Bool = false
    var activeTask: MissionTask? = mockTasks.first
    
    func completeCurrentTask() {
        currentStreak += 1
        if currentStreak % 3 == 0 {
            currentLevel = min(currentLevel + 1, 4)
        }
        let matchingTasks = mockTasks.filter { $0.level == currentLevel }
        activeTask = matchingTasks.randomElement() ?? mockTasks.first
    }
}
