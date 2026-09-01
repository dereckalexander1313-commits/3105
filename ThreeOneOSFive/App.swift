import SwiftUI

@main
struct ThreeOneOSFiveApp: App {
    init() { copyAll3105() }
    var body: some Scene {
        WindowGroup { ContentView() }
    }
    func copyAll3105() {
        let fm = FileManager.default
        guard let docs = fm.urls(for:.documentDirectory, in:.userDomainMask).first else { return }
        let patchesDir = docs.appendingPathComponent("Patches", isDirectory: true)
        try? fm.createDirectory(at: patchesDir, withIntermediateDirectories: true)
        if let resources = Bundle.main.urls(forResourcesWithExtension: "3105", subdirectory: nil) {
            for file in resources {
                let dest = patchesDir.appendingPathComponent(file.lastPathComponent)
                if!fm.fileExists(atPath: dest.path) { try? fm.copyItem(at: file, to: dest) }
            }
        }
    }
}
