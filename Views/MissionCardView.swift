import SwiftUI

struct MissionCardView: View {
    @Bindable var state: AppStateManager
    @State private var isCompleted = false

    var body: some View {
        VStack(spacing: 20) {
            if let task = state.activeTask {
                VStack(alignment: .leading, spacing: 12) {
                    Text("LEVEL \(task.level) • \(task.category.uppercased())")
                        .font(.caption).bold().foregroundStyle(.secondary)
                    Text(task.title).font(.title2).bold()
                    Text(task.description).font(.body).foregroundStyle(.secondary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 20).fill(.thinMaterial))
                
                Button(action: {
                    withAnimation(.spring()) {
                        isCompleted = true
                        state.completeCurrentTask()
                    }
                }) {
                    Label("Complete Mission", systemImage: "checkmark.circle.fill")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                }
                .sensoryFeedback(.success, trigger: isCompleted)
            }
        }
        .padding()
    }
}
