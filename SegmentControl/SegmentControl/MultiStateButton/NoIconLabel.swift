import SwiftUI

struct NoIconLabel<Title: View>: View {
    var title: Title
    var contentSize: ButtonContentSize
    var packing: ButtonLabelPacking

    var body: some View {
        HStack(spacing: 0) {
            switch packing {
            case .leftAligned:
                title
                Spacer(minLength: 0)
            default:
                title
            }
        }
        .padding(.horizontal, contentSize.labelTitlePadding)
    }
}

#if DEBUG
public struct NoIconLabel_Previews: PreviewProvider {
    public static var previews: some View {
        NoIconLabel(
            title: Text("Done"),
            contentSize: .small,
            packing: .leftAligned
        )
        NoIconLabel(
            title: Text("Done"),
            contentSize: .medium,
            packing: .centerAligned
        )
    }
}
#endif
