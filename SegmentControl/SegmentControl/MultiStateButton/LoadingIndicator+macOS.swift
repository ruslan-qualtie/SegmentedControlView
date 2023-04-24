import SwiftUI

struct LoadingIndicator: NSViewRepresentable {
    var color: Color

    func makeNSView(context: NSViewRepresentableContext<LoadingIndicator>) -> NSProgressIndicator {
        let result = NSProgressIndicator()
        result.style = .spinning
        result.isIndeterminate = true
        result.startAnimation(nil)

        return result
    }

    func updateNSView(_ nsView: NSProgressIndicator, context: NSViewRepresentableContext<LoadingIndicator>) {
        nsView.set(polynomialColor: NSColor(color))
    }
}
