import Foundation

enum ButtonContentSize: CaseIterable {
    case small
    case medium
    case large
}

extension ButtonContentSize {
    var labelContentSpacing: CGFloat {
        switch self {
        case .small:
            return 3
        case .medium, .large:
            return 5
        }
    }

    var labelTitlePadding: CGFloat {
        switch self {
        case .small:
            return 3
        case .medium:
            return 5
        case .large:
            return 1
        }
    }

    var labelIconPadding: CGFloat {
        switch self {
        case .small:
            return 1
        case .medium:
            return 2
        case .large:
            return 0
        }
    }
}
