import SwiftUI

struct ButtonLabel<Title: View, Icon: View>: View {
    @Environment(\.isLoading) private var isLoading
    private let titleContent: (() -> Title)?
    private let iconContent: (() -> Icon)?
    private let colorStyle: ButtonColorStyle
    private let contentSize: ButtonContentSize
    private let iconPosition: ButtonLabelIconPosition
    private let packing: ButtonLabelPacking

    init(
        title: (() -> Title)? = nil,
        icon: (() -> Icon)? = nil,
        colorStyle: ButtonColorStyle,
        contentSize: ButtonContentSize,
        iconPosition: ButtonLabelIconPosition,
        packing: ButtonLabelPacking
    ) {
        self.titleContent = title
        self.iconContent = icon
        self.colorStyle = colorStyle
        self.contentSize = contentSize
        self.iconPosition = iconPosition
        self.packing = packing
    }

    init(
        text: String,
        systemImage: String,
        colorStyle: ButtonColorStyle = SolidBlueColorStyle(),
        contentSize: ButtonContentSize = .medium,
        iconPosition: ButtonLabelIconPosition = .iconLeft,
        packing: ButtonLabelPacking = .centerAligned
    ) where Title == Text, Icon == Image {
        self.init(
            title: { Text(text) },
            icon: { Image(systemName: systemImage) },
            colorStyle: colorStyle,
            contentSize: contentSize,
            iconPosition: iconPosition,
            packing: packing
        )
    }

    init(
        systemImage: String,
        colorStyle: ButtonColorStyle = SolidBlueColorStyle(),
        contentSize: ButtonContentSize = .medium,
        packing: ButtonLabelPacking = .centerAligned
    ) where Title == Text, Icon == Image {
        self.init(
            icon: { Image(systemName: systemImage) },
            colorStyle: colorStyle,
            contentSize: contentSize,
            iconPosition: .onlyIcon,
            packing: packing
        )
    }

    init(
        text: String,
        colorStyle: ButtonColorStyle = SolidBlueColorStyle(),
        contentSize: ButtonContentSize = .medium,
        packing: ButtonLabelPacking = .centerAligned
    ) where Title == Text, Icon == Image {
        self.init(
            title: { Text(text) },
            colorStyle: colorStyle,
            contentSize: contentSize,
            iconPosition: .noIcon,
            packing: packing
        )
    }

    private var iconSize: CGSize {
        switch contentSize {
        case .small, .medium:
            return .init(width: 24, height: 24)
        case .large:
            return .init(width: 28, height: 28)
        }
    }

    private var progressViewScale: CGFloat {
        switch contentSize {
        case .small, .medium:
            return 0.5
        case .large:
            return 0.7
        }
    }

    private var icon: some View {
        Group {
            if isLoading {
                LoadingIndicator(color: colorStyle.loadingIndicatorColor)
                    .scaleEffect(progressViewScale, anchor: .center)
            } else {
                iconContent?()
            }
        }
        .frame(width: iconSize.width, height: iconSize.height)
    }

    private var title: some View {
        titleContent?()
            .fixedSize()
            .frame(height: iconSize.height)
    }

    var body: some View {
        Group {
            switch iconPosition {
            case .iconLeft:
                IconLeftLabel(
                    title: title,
                    icon: icon,
                    contentSize: contentSize,
                    packing: packing
                )
            case .iconRight:
                IconRightLabel(
                    title: title,
                    icon: icon,
                    contentSize: contentSize,
                    packing: packing
                )
            case .noIcon:
                NoIconLabel(
                    title: title,
                    contentSize: contentSize,
                    packing: packing
                )
            case .onlyIcon:
                IconLabel(icon: icon)
            }
        }
    }
}

#if DEBUG
public struct ButtonLabel_Previews: PreviewProvider {
    public static var previews: some View {
        ButtonLabel(
            text: "Done",
            systemImage: "doc.text.below.ecg",
            contentSize: .small
        )
        ButtonLabel(
            text: "Done",
            systemImage: "doc.text.below.ecg",
            contentSize: .medium,
            iconPosition: .iconRight
        )
        ButtonLabel(
            text: "Done",
            contentSize: .large
        )
        ButtonLabel(
            systemImage: "info.circle",
            contentSize: .small
        )
    }
}
#endif
