import SwiftUI

@_silgen_name("mpv_create")
func mpv_create() -> OpaquePointer?

@_silgen_name("mpv_terminate_destroy")
func mpv_terminate_destroy(_ ctx: OpaquePointer?)

@_silgen_name("mpv_set_option_string")
func mpv_set_option_string(_ ctx: OpaquePointer?, _ name: UnsafePointer<CChar>?, _ value: UnsafePointer<CChar>?) -> Int32

@main
struct MediaProbeApp: App {
    var body: some Scene { WindowGroup { ContentView() } }
}

struct ContentView: View {
    @State private var info = "linking..."
    var body: some View {
        VStack(spacing: 12) {
            Text("MPVKit device link gate").font(.title2.bold())
            Text(info).font(.caption).monospaced()
        }
        .padding()
        .onAppear {
            guard let ctx = mpv_create() else { info = "mpv_create -> nil"; return }
            _ = mpv_set_option_string(ctx, "vo", "gpu-next")
            // libavformat / libass presence: pull one symbol each through the same ctx-free path
            _ = ass_library_init_probe()
            info = "libmpv ctx ok / libass ok"
            mpv_terminate_destroy(ctx)
        }
    }
}

@_silgen_name("ass_library_init")
func ass_library_init() -> OpaquePointer?

func ass_library_init_probe() -> Bool { ass_library_init() != nil }
