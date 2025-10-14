import SwiftUI

enum RootTab {
    case home
    case levels
}

struct RootView: View {
    @State private var selectedTab: RootTab = .home

    var body: some View {
        ZStack {
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                case .levels:
                    LevelesView()
                }
            }
            .background(Color(.systemGroupedBackground))
        }
        .ignoresSafeArea(edges: .bottom)
        .safeAreaInset(edge: .bottom) {
            NavBar(
                onHomeTapped: { selectedTab = .home },
                onTrophyTapped: { selectedTab = .levels }
            )
            .background(.ultraThinMaterial)
        }
    }
}

#Preview {
    RootView()
}
