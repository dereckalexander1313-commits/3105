import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView().tabItem { Label("Home", systemImage: "house.fill") }
            PatchesView().tabItem { Label("Patches", systemImage: "puzzlepiece.extension.fill") }
        }.accentColor(.purple)
    }
}
struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("ALEXITO STORE").font(.system(size: 34, weight:.black)).foregroundColor(.purple)
            Text("iOS 15.0 - 15.8.3").foregroundColor(.purple)
            Spacer()
        }.padding().background(Color.white)
    }
}
struct PatchesView: View {
    @State var files: [String] = []
    var body: some View {
        NavigationView {
            List(files, id: \.self) { Text($0).foregroundColor(.purple) }
           .navigationTitle("Patches").onAppear { load() }
        }
    }
    func load() {
        let fm = FileManager.default
        if let docs = fm.urls(for:.documentDirectory, in:.userDomainMask).first {
            let dir = docs.appendingPathComponent("Patches")
            files = (try? fm.contentsOfDirectory(atPath: dir.path))?? []
        }
    }
}
