import SwiftUI

struct MainView: View {
    @State private var selectedTab: TabBarItem = .home
    @Environment(\.floatingTabBarBottomPadding) private var bottomPadding
    @State private var cellHeight: CGFloat = .zero
    @State private var shouldShowTitleSectionBackground = false
    @Namespace private var tabAnimation
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                VStack(spacing: 0) {
                    Text(selectedTab.title)
                        .font(.title)
                        .bold()
                        .zIndex(1)
                        .frame(maxWidth: .infinity)
                        .padding(.bottom)
                        .background {
                            if shouldShowTitleSectionBackground {
                                Color
                                    .clear
                                    .background(.ultraThinMaterial)
                            }
                        }
                }
                .toolbarVisibility(.hidden, for: .tabBar)
                .toolbarBackgroundVisibility(.hidden, for: .tabBar)
                .padding(.bottom, bottomPadding)
            }
        }
        .overlay(alignment: .bottom) {
            bottomBar
        }
    }
    
    private var bottomBar: some View {
        HStack(spacing: 0) {
            ForEach(TabBarItem.allCases, id: \.self) { tab in
                VStack(spacing: 4) {
                    ZStack {
                        if selectedTab == tab {
                            Capsule()
                                .fill(.blue.gradient)
                                .padding(8)
                                .frame(maxWidth: .infinity)
                                .shadow(color: .blue.opacity(0.4), radius: 12)
                                .matchedGeometryEffect(id: "tab_animation", in: tabAnimation)
                        }
                        tab.icon
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .contentShape(.rect)
                            .foregroundStyle(tab == selectedTab ? .white : .secondary)
                            .scaleEffect(tab == selectedTab ? 1.1 : 1)
                            .onTapGesture {
                                selectedTab = tab
                            }
                    }
                }
            }
        }
        .animation(.snappy(duration: 0.35), value: selectedTab)
        .frame(height: 60)
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
        .padding(.bottom, 16)
        .padding(.horizontal)
    }
}

#Preview {
    MainView()
}







