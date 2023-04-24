import SwiftUI

struct IconRightLabel<Title: View, Icon: View>: View {
    var title: Title
    var icon: Icon
    var contentSize: ButtonContentSize
    var packing: ButtonLabelPacking

    var body: some View {
        HStack(spacing: 0) {
            switch packing {
            case .spaceBetween:
                title
                    .padding(.trailing, contentSize.labelContentSpacing)
                Spacer(minLength: 0)
                icon
                    .padding(.trailing, contentSize.labelIconPadding)
            case .centerAligned:
                title
                    .padding(.trailing, contentSize.labelContentSpacing)
                icon
                    .padding(.trailing, contentSize.labelIconPadding)
            case .leftAligned:
                title
                    .padding(.trailing, contentSize.labelContentSpacing)
                icon
                    .padding(.trailing, contentSize.labelIconPadding)
                Spacer(minLength: 0)
            }
        }
        .padding(.leading, contentSize.labelTitlePadding)
    }
}

#if DEBUG
public struct IconRightLabel_Previews: PreviewProvider {
    public static var previews: some View {
        IconRightLabel(
            title: Text("Done"),
            icon: Image(systemName: "doc.text.below.ecg"),
            contentSize: .small,
            packing: .spaceBetween
        )
        IconRightLabel(
            title: Text("Done"),
            icon: Image(systemName: "doc.text.below.ecg"),
            contentSize: .medium,
            packing: .centerAligned
        )
        IconRightLabel(
            title: Text("Done"),
            icon: Image(systemName: "doc.text.below.ecg"),
            contentSize: .large,
            packing: .leftAligned
        )
    }
}
#endif
