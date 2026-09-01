import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("ALEXITO STORE")
                    .font(.system(size: 32, weight: .black))
                    .foregroundColor(.white)
                Text("Build OK ✅")
                    .foregroundColor(.green)
            }
        }
    }
}

#Preview {
    ContentView()
}
