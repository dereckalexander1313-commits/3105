import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var patchDraftStore: PatchDraftStore
    @EnvironmentObject private var patchStore: PatchStore
    @EnvironmentObject private var repositoryStore: RepositoryStore
    @State private var tabNavigation: AppTabNavigation
    @State private var showSettings = false
    @State private var isLogged = UserDefaults.standard.string(forKey: "alexito_key") != nil

    init() {
        _tabNavigation = State(initialValue: AppTabNavigation())
    }

    var body: some View {
        if !isLogged {
            AlexitoLoginView(isLogged: $isLogged)
        } else {
            mainApp
        }
    }
    
    var mainApp: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            TabView(selection: $tabNavigation.selectedTab) {
                ForEach(AppTab.allCases) { tab in
                    tab.view
                        .tabItem {
                            Label(tab.titleKey.localized, systemImage: tab.systemImage)
                        }
                        .tag(tab)
                }
            }
            .tint(Color(red: 0.58, green: 0.15, blue: 1.0))
        }
        .preferredColorScheme(.dark)
    }
}
