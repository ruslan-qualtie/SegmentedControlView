import SwiftUI

protocol ButtonColorStyle {
    var loadingIndicatorColor: Color { get }
    var foregroundDefaultColor: Color { get }
    var foregroundDisabledColor: Color { get }
    var backgroundDefaultColor: Color { get }
    var backgroundDisabledColor: Color { get }
    var backgroundHoverColor: Color { get }
    var backgroundActiveColor: Color { get }
}

extension ButtonColorStyle {
    var foregroundDisabledColor: Color { foregroundDefaultColor.opacity(0.3) }
    var backgroundDefaultColor: Color { .clear }
    var backgroundDisabledColor: Color { backgroundDefaultColor.opacity(0.3) }
}

struct SolidBlueColorStyle: ButtonColorStyle {
    var loadingIndicatorColor: Color = .white
    var foregroundDefaultColor: Color = .white
    var backgroundDefaultColor: Color = .defaultButtonBackground
    var backgroundHoverColor: Color = .defaultButtonHoverBackground
    var backgroundActiveColor: Color = .defaultButtonSelectedBackground
}

struct SolidGreenColorStyle: ButtonColorStyle {
    var loadingIndicatorColor: Color = .white
    var foregroundDefaultColor: Color = .white
    var backgroundDefaultColor: Color = .init("cyan-6").opacity(0.8)
    var backgroundHoverColor: Color = .init("cyan-6").opacity(0.9)
    var backgroundActiveColor: Color = .init("cyan-6")
}

struct SolidWhiteColorStyle: ButtonColorStyle {
    var loadingIndicatorColor: Color = .black
    var foregroundDefaultColor: Color = .init("dark-indigo")
    var foregroundDisabledColor: Color = .init("dark-indigo").opacity(0.7)
    var backgroundDefaultColor: Color = .white.opacity(0.8)
    var backgroundHoverColor: Color = .white.opacity(0.9)
    var backgroundActiveColor: Color = .white
}

struct PlainColorStyle: ButtonColorStyle {
    var loadingIndicatorColor: Color = .init("geekblue-3")
    var foregroundDefaultColor: Color = .init("geekblue-3")
    var backgroundHoverColor: Color = .init("geekblue-4").opacity(0.15)
    var backgroundActiveColor: Color = .iconButtonSelectedBackground
}

struct TintedColorStyle: ButtonColorStyle {
    var loadingIndicatorColor: Color = .init("geekblue-3")
    var foregroundDefaultColor: Color = .init("geekblue-3")
    var backgroundDefaultColor: Color = .init("geekblue-4").opacity(0.1)
    var backgroundHoverColor: Color = .init("geekblue-4").opacity(0.15)
    var backgroundActiveColor: Color = .init("geekblue-4").opacity(0.20)
}

struct FlaggedColorStyle: ButtonColorStyle {
    var loadingIndicatorColor: Color = .init("geekblue-3")
    var foregroundDefaultColor: Color = .init("gold-6")
    var foregroundDisabledColor: Color = .init("gold-6")
    var backgroundDefaultColor: Color = .init("geekblue-4").opacity(0.1)
    var backgroundDisabledColor: Color = .init("geekblue-4").opacity(0.1)
    var backgroundHoverColor: Color = .init("geekblue-4").opacity(0.15)
    var backgroundActiveColor: Color = .init("geekblue-4").opacity(0.20)
}

struct TintedDestructiveColorStyle: ButtonColorStyle {
    var loadingIndicatorColor: Color = .init("red-4")
    var foregroundDefaultColor: Color = .init("red-4")
    var backgroundDefaultColor: Color = .init("red-4").opacity(0.1)
    var backgroundHoverColor: Color = .init("red-4").opacity(0.15)
    var backgroundActiveColor: Color = .init("red-4").opacity(0.20)
}
