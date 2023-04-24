import SwiftUI

struct MultiStateButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @State private var isHovering = false
    private let colorStyle: ButtonColorStyle
    private let contentSize: ButtonContentSize
    private let contentMode: ButtonContentMode
    private let shape: ButtonShape

    private var font: Font {
        switch contentSize {
        case .small, .medium:
            return .system(size: 16, weight: .semibold)
        case .large:
            return .system(size: 20, weight: .semibold)
        }
    }

    private var padding: CGFloat {
        switch contentSize {
        case .small:
            return 4
        case .medium:
            return 10
        case .large:
            return 14
        }
    }

    // workaround to have coverage for isEnabled
    init(
        colorStyle: ButtonColorStyle,
        contentSize: ButtonContentSize,
        contentMode: ButtonContentMode,
        shape: ButtonShape = .roundedRectangle
    ) {
        self.colorStyle = colorStyle
        self.contentSize = contentSize
        self.contentMode = contentMode
        self.shape = shape
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(font)
            .padding(padding)
            .contentMode(contentMode)
            .onHover(perform: updateHovering(onHover:))
            .foregroundColor(foregroundColor())
            .background(backgroundColor(isPressed: configuration.isPressed))
            .buttonShape(shape)
    }

    private func foregroundColor() -> Color {
        if isEnabled {
            return colorStyle.foregroundDefaultColor
        }
        return colorStyle.foregroundDisabledColor
    }

    private func backgroundColor(isPressed: Bool) -> Color {
        guard isEnabled else {
            return colorStyle.backgroundDisabledColor
        }
        if isPressed {
            return colorStyle.backgroundActiveColor
        }
        if isHovering {
            return colorStyle.backgroundHoverColor
        }
        return colorStyle.backgroundDefaultColor
    }

    private func updateHovering(onHover: Bool) {
        withAnimation(.easeOut(duration: 0.05)) {
            isHovering = onHover
        }
    }
}

