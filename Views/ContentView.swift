import SwiftUI

struct ContentView: View {
    @State private var appState = AppStateManager()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Streak: 🔥 \(appState.currentStreak) days")
                            .font(.headline)
                        Text("Current Tier: Level \(appState.currentLevel)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    
                    // Pitch Demo Trigger Button
                    Button("Simulate Intercept") {
                        appState.isIntercepted = true
                    }
                    .buttonStyle(.bordered)
                    .tint(.orange)
                }
                .padding(.horizontal)
                
                MissionCardView(state: appState)
                Spacer()
            }
            .navigationTitle("BreakTheScroll")
            .fullScreenCover(isPresented: $appState.isIntercepted) {
                InterceptSheetView(state: appState)
            }
        }
    }
}

#Preview {
    ContentView()
}
