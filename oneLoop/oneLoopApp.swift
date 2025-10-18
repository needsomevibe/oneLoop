import SwiftUI

@main
struct OneLoopApp: App {
    @StateObject var progressVM = ChallengeProgressViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(progressVM)
        }
    }
}
