import SwiftUI

@main
struct SegmentControlApp: App {
    @State private var selection = true

    var body: some Scene {
        WindowGroup {
            ControlsDemoView()
                .padding(50)
                .background(Color.pageBackground)
        }
    }
}
