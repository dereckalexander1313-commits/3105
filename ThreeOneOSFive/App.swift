import SwiftUI

@main
struct YourAppNameApp: App {
    init() {
        copyBundledPatches()
        setupPurpleAppearance()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

    func copyBundledPatches() {
        let fileManager = FileManager.default
        guard let docsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let patchesDir = docsURL.appendingPathComponent("Patches", isDirectory: true)
        try? fileManager.createDirectory(at: patchesDir, withIntermediateDirectories: true)

        let bundledPatches = [
            "com.ea.ios.simsmobile_5912fbb3-9a69-4f00-bd38-1c0ca6d04b4c_v7_9.7.9.139048.3105",
            "com.ea.ios.simsmobile_5912fbb3-9a69-4f00-bd38-1c0ca6d04b4c_v7_9.7.0.139048.3105",
            "com.ea.ios.simsmobile_5912fbb3-9a69-4f00-bd38-1c0ca6d04b4c_v7_9.7.1.139048.3105"
        ]

        for patchName in bundledPatches {
            if let bundleURL = Bundle.main.url(forResource: patchName, withExtension: nil) {
                let destURL = patchesDir.appendingPathComponent(patchName)
                if !fileManager.fileExists(atPath: destURL.path) {
                    try? fileManager.copyItem(at: bundleURL, to: destURL)
                }
            }
        }
    }

    func setupPurpleAppearance() {
        UINavigationBar.appearance().tintColor = UIColor.purple
        UITabBar.appearance().tintColor = UIColor.purple
        UIButton.appearance().tintColor = UIColor.purple
    }
}
