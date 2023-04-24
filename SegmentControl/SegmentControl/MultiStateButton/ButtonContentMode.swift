import SwiftUI

enum ButtonContentMode: Equatable {
    case hug
    case fixed(width: CGFloat)
    case fill
}

extension View {
    @ViewBuilder func contentMode(_ contentMode: ButtonContentMode) -> some View {
        switch contentMode {
        case .hug:
            self
        case .fixed(width: let width):
            self.frame(width: width)
        case .fill:
            self.frame(maxWidth: .infinity)
        }
    }
}
