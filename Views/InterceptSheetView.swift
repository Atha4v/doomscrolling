import SwiftUI

struct InterceptSheetView: View {
    @Bindable var state: AppStateManager
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "hand.raised.fill")
                .font(.system(size: 60))
                .foregroundStyle(.orange)
            
            Text("Doomscrolling Intercepted")
                .font(.title).bold()
            
            Text("You've been scrolling for 20 minutes. Break the loop with a quick 1-minute win.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
            
            Button("Accept Mission") {
                state.isIntercepted = false
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .padding()
    }
}
