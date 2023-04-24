import SwiftUI

struct SegmentedControlView<Content>: View where Content: View {
    @Binding var selection: Int
    var segmentsCount: Int
    var segmentView: (Int) -> Content
    @State private var frames: Array<CGRect>
    @State private var isHovering = false
    @State private var isHoveredIndex = 0
    @GestureState private var isActive = false
    
    var hoverColor: Color = .iconButtonBackground
    var activeColor: Color = .iconButtonSelectedBackground
    
    private var backgroundColor: Color {
        if isActive {
            return activeColor
        }
        return isHovering ? hoverColor : .clear
    }
    
    public init(selection: Binding<Int>, segmentsCount: Int, @ViewBuilder segmentView: @escaping (Int) -> Content) {
        self._selection = selection
        self.segmentsCount = segmentsCount
        self.segmentView = segmentView
        self.frames = Array<CGRect>(repeating: .zero, count: segmentsCount)
    }

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<segmentsCount, id: \.self) { index in
                segmentView(index)
                    .background(
                        GeometryReader { geometry in
                            Color.clear
                                .onAppear { frames[index] = geometry.frame(in: .global) }
                        }
                    )
                    .onHover {
                        isHovering = $0
                        isHoveredIndex = index
                    }
                    .simultaneousGesture(
                        DragGesture(minimumDistance: 0.0)
                            .updating($isActive, body: { _, active, _ in
                                active = true
                            })
                    )
                    .background(
                        ZStack {
                            RoundedRectangle(cornerRadius: 8.0, style: .circular)
                            .fill(isHovering && isHoveredIndex == index && selection != index ? Color.pageBackground : Color.clear)
                            RoundedRectangle(cornerRadius: 8.0, style: .circular)
                            .fill(isHovering && isHoveredIndex == index && selection != index ? backgroundColor : Color.clear)
                        }
                    )
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 8.0, style: .circular)
                .fill(Color.segmentSelectedBackground)
                .frame(
                    width: frames[selection].width,
                    height: frames[selection].height
                )
                .offset(x: frames[selection].minX - frames[0].minX)
                .animation(.easeOut(duration: 0.3), value: selection)
            , alignment: .leading
        )
        .background(
            RoundedRectangle(cornerRadius: 8.0, style: .circular)
                .stroke(Color.iconButtonBackground, lineWidth: 2)
                .padding(1)
        )
    }
}
