import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var patchDraftStore: PatchDraftStore
    @EnvironmentObject private var patchStore: PatchStore
    @EnvironmentObject private var repositoryStore: RepositoryStore
    @State private var tabNavigation: AppTabNavigation
    @State private var showSettings = false
    
    // --- TEMA ALEXITO ---
    let alexitoPurple = Color(red: 0.68, green: 0.2, blue: 1.0)
    let alexitoBlack = Color.black

    init() {
        _tabNavigation = State(initialValue: AppTabNavigation())
    }

    var body: some View {
        ZStack {
            alexitoBlack.ignoresSafeArea()
            VStack(spacing: 0) {
                // Barra superior ALEXITO
                HStack {
                    Text("ALEXITO")
                        .font(.system(size: 28, weight: .black))
                        .foregroundColor(alexitoPurple)
                    Spacer()
                }
                .padding()
                .background(alexitoBlack)
                
                TabView(selection: $tabNavigation.selectedTab) {
                    ForEach(AppTab.allCases) { tab in
                        tab.view
                            .tabItem {
                                Label(tab.titleKey.localized, systemImage: tab.systemImage)
                            }
                            .tag(tab)
                    }
                }
                .tint(alexitoPurple)
            }
        }
        .preferredColorScheme(.dark)
    }
}
