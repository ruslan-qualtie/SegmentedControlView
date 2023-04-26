import SwiftUI

struct OldSegmentButton<Icon: View>: View {
    let icon: Icon
    let isSelected: Bool
    let action: ActionCompletion

    init(@ViewBuilder icon: () -> Icon, isSelected: Bool, action: @escaping ActionCompletion) {
        self.icon = icon()
        self.isSelected = isSelected
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            ZStack {
                Rectangle()
                    .fill(backgroundColor)
                    .cornerRadius(8)
                    .contentShape(Rectangle())
                icon
            }
        }
        .buttonStyle(PlainButtonStyle())
    }

    private var backgroundColor: Color {
        isSelected ? .segmentButtonSelectedBackground : .clear
    }
}

#if DEBUG
public struct OldSegmentButton_Previews: PreviewProvider {
    public static var previews: some View {
        PreviewContainer([
            OldSegmentButton(icon: Icons.barCharts, isSelected: true, action: shouldNotBeCalled),
            OldSegmentButton(icon: Icons.barCharts, isSelected: false, action: shouldNotBeCalled)
        ], itemSize: .init(width: 40, height: 40))
    }
}
#endif

