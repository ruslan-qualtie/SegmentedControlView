import SwiftUI

enum ButtonShape: Equatable {
    case roundedRectangle
    case circle
}

extension View {
    @ViewBuilder func buttonShape(_ shape: ButtonShape) -> some View {
        switch shape {
        case .roundedRectangle:
            self.clipShape(RoundedRectangle(cornerRadius: 8.0, style: .circular))
        case .circle:
            self.clipShape(Circle())
        }
    }
}
