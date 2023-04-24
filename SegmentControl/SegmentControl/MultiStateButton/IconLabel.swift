import SwiftUI

struct IconLabel<Icon: View>: View {
    var icon: Icon

    var body: some View {
        icon
    }
}

#if DEBUG
public struct IconLabel_Previews: PreviewProvider {
    public static var previews: some View {
        IconLabel(
            icon: Image(systemName: "doc.text.below.ecg")
        )
    }
}
#endif
