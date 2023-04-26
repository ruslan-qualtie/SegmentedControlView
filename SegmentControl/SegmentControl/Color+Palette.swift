import SwiftUI

extension Color {
    static var pageBackground: Color { Color("dark-indigo") }
    static var iconButtonTitle: Color { Color("geekblue-3") }
    static var iconButtonBackground: Color { Color("geekblue-4").opacity(0.1) }
    static var iconButtonSelectedBackground: Color { Color("geekblue-4").opacity(0.15) }
    static var segmentButtonSelectedBackground: Color { Color("geekblue-4").opacity(0.25) }
    static var segmentSelectedBackground: Color { Color("selected-segment") }
    static var defaultButtonBackground: Color { Color("geekblue-6").opacity(0.8) }
    static var defaultButtonHoverBackground: Color { Color("geekblue-6").opacity(0.9) }
    static var defaultButtonSelectedBackground: Color { Color("geekblue-6") }
    static var bannerText: Color { Color("gold-6") }
    static var secondaryButtonTitle: Color { Color("gray-1") }
    static var subtleTitle: Color { Color("gray-7") }
    static var attention: Color { Color("cyan-6") }
    static var warning: Color { Color("orange-6") }
    static var iconButtonHoverBackground: Color { Color("geekblue-4").opacity(0.15) }
}
