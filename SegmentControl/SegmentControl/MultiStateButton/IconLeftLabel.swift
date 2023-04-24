import SwiftUI

struct IconLeftLabel<Title: View, Icon: View>: View {
    var title: Title
    var icon: Icon
    var contentSize: ButtonContentSize
    var packing: ButtonLabelPacking

    var body: some View {
        HStack(spacing: 0) {
            switch packing {
            case .spaceBetween:
                icon
                Spacer(minLength: 0)
                title
                    .padding(.leading, contentSize.labelContentSpacing)
                    .padding(.trailing, contentSize.labelTitlePadding)
            case .centerAligned:
                icon
                title
                    .padding(.leading, contentSize.labelContentSpacing)
                    .padding(.trailing, contentSize.labelTitlePadding)
            case .leftAligned:
                icon
                title
                    .padding(.leading, contentSize.labelContentSpacing)
                    .padding(.trailing, contentSize.labelTitlePadding)
                Spacer(minLength: 0)
            }
        }
        .padding(.leading, contentSize.labelIconPadding)
    }
}

#if DEBUG
public struct IconLeftLabel_Previews: PreviewProvider {
    public static var previews: some View {
        IconLeftLabel(
            title: Text("Done"),
            icon: Image(systemName: "doc.text.below.ecg"),
            contentSize: .small,
            packing: .spaceBetween
        )
        IconLeftLabel(
            title: Text("Done"),
            icon: Image(systemName: "doc.text.below.ecg"),
            contentSize: .medium,
            packing: .centerAligned
        )
        IconLeftLabel(
            title: Text("Done"),
            icon: Image(systemName: "doc.text.below.ecg"),
            contentSize: .large,
            packing: .leftAligned
        )
    }
}
#endif
