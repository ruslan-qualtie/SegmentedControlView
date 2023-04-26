import SwiftUI

struct SegmentButton: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let action: ActionCompletion

    var body: some View {
        Button(action: action) {
            ButtonLabel(
                text: title,
                systemImage: icon,
                colorStyle: style(by: isSelected),
                contentSize: .medium
            )
        }
        .buttonStyle(
            MultiStateButtonStyle(
                colorStyle: style(by: isSelected),
                contentSize: .medium,
                contentMode: .hug
            )
        )
    }
    
    private func style(by selected: Bool) -> ButtonColorStyle {
        selected ? SelectedSegmentButtonColorStyle() : SegmentButtonColorStyle()
    }
}

#if DEBUG
public struct SegmentButton_Previews: PreviewProvider {
    public static var previews: some View {
        PreviewContainer([
            SegmentButton(
                title: "History",
                icon: "chart.xyaxis.line",
                isSelected: true,
                action: shouldNotBeCalled
            ),
            SegmentButton(
                title: "History",
                icon: "chart.xyaxis.line",
                isSelected: false,
                action: shouldNotBeCalled
            )
        ])
    }
}
#endif
