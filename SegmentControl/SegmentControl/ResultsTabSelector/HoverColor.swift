import SwiftUI

struct HoverColor: ViewModifier {
    @State private var isHovering = false

    private let hoverColor: Color
    private let defaultColor: Color

    private var backgroundColor: Color {
        isHovering ? hoverColor : defaultColor
    }

    // workaround for #coverage
    public init(hoverColor: Color, defaultColor: Color) {
        self.hoverColor = hoverColor
        self.defaultColor = defaultColor
    }

    func body(content: Content) -> some View {
        content
            .background(backgroundColor)
            .onHover(perform: updateHovering(onHover:))
    }

    private func updateHovering(onHover: Bool) {
        withAnimation(.easeOut(duration: 0.05)) {
            isHovering = onHover
        }
    }
}

extension View {
    func hover(color: Color, defaultColor: Color = .clear) -> some View {
        modifier(HoverColor(hoverColor: color, defaultColor: defaultColor))
    }
}
