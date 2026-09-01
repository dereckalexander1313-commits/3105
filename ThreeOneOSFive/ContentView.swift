import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // PESTAÑA 1 - HOME
            ZStack {
                Color.black.ignoresSafeArea()
                VStack(spacing: 20) {
                    Text("ALEXITO STORE")
                        .font(.system(size: 36, weight: .black, design: .rounded))
                        .foregroundColor(.purple)
                        .shadow(color: .purple.opacity(0.8), radius: 15)
                    
                    Text("Premium Patches")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.headline)

                    Spacer()
                    
                    // Aqui llama tu Home real
                    HomeView()
                    
                    Spacer()
                }
                .padding()
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }

            // PESTAÑA 2 - PATCHES (AQUI YA ESTARAN LOS 3 ARCHIVOS)
            PatchesView()
                .tabItem {
                    Label("Patches", systemImage: "puzzlepiece.extension.fill")
                }
        }
        .tint(Color.purple) // TODO MORADO
    }
}
