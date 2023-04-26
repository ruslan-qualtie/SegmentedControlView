#if os(macOS)
import AppKit
import SwiftUI

struct SegmentControl: NSViewRepresentable {
    func makeCoordinator() -> SegmentControl.Coordinator {
        Coordinator(parent: self)
    }
    func makeNSView(context: NSViewRepresentableContext<SegmentControl>) -> NSSegmentedControl {
        let control = NSSegmentedControl(
            images: [
                NSImage(named: NSImage.Name("grid"))!,
                NSImage(named: NSImage.Name("list"))!
            ],
            trackingMode: .selectOne,
            target: context.coordinator,
            action: #selector(Coordinator.onChange(_:))
        )
        return control
    }
    func updateNSView(_ nsView: NSSegmentedControl, context: NSViewRepresentableContext<SegmentControl>) {
    }
    class Coordinator {
        let parent: SegmentControl
        init(parent: SegmentControl) {
            self.parent = parent
        }
        @objc
        func onChange(_ control: NSSegmentedControl) {
        }
    }
}
#endif
