import SwiftUI

struct SegmentControlButton: View {
    let title: String
    let icon: String
    let action: ActionCompletion

    var body: some View {
        Button(action: action) {
            ButtonLabel(
                text: title,
                systemImage: icon,
                colorStyle: SegmentControlColorStyle(),
                contentSize: .medium
            )
        }
        .buttonStyle(
            MultiStateButtonStyle(
                colorStyle: SegmentControlColorStyle(),
                contentSize: .medium,
                contentMode: .hug
            )
        )
    }
}

#if DEBUG
public struct PlainButton_Previews: PreviewProvider {
    public static var previews: some View {
        SegmentControlButton(
            title: "History",
            icon: "chart.xyaxis.line",
            action: shouldNotBeCalled
        )
        .frame(height: 44)
    }
}
#endif

