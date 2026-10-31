import SwiftUI
import KSPlayer

@main
struct MediaProbeApp: App {
    var body: some Scene { WindowGroup { ContentView() } }
}

struct ContentView: View {
    @State private var info = "linking..."
    var body: some View {
        VStack(spacing: 12) {
            Text("KSPlayer linked").font(.title2.bold())
            Text(info).font(.caption).foregroundStyle(.secondary)
        }
        .padding()
        .onAppear {
            KSOptions.secondPlayerType = KSMEPlayer.self
            info = "second engine = \(KSOptions.secondPlayerType)"
        }
    }
}
