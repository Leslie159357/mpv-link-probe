import SwiftUI

@main
struct MediaProbeApp: App {
    var body: some Scene { WindowGroup { ContentView() } }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("MPVKit linked").font(.title2.bold())
            Text("libmpv + ffmpeg + libass + libplacebo + libdovi").font(.caption)
        }
        .padding()
    }
}
