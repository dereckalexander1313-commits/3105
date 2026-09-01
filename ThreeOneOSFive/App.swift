import SwiftUI

@main
struct ThreeOneOSFiveApp: App {
    init() {
        let fm = FileManager.default
        let docs = fm.urls(for:.documentDirectory, in:.userDomainMask)[0]
        let nombres = ["AIMBOT PECHO", "HOLOGRAMA VERDE Y AMARILLO", "HOLOGRAMA BLANCO"]
        for nombre in nombres {
            let destino = docs.appendingPathComponent("\(nombre).3105")
            if fm.fileExists(atPath: destino.path) { continue }
            if let origen = Bundle.main.url(forResource: nombre, withExtension: "3105") {
                try? fm.copyItem(at: origen, to: destino)
            }
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
