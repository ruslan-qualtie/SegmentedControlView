import SwiftUI

struct ControlsDemoView: View {
    @State private var selection = 0

    private var titles = ["Results", "History", "Metrics"]
    private var icons = ["chart.bar.fill", "chart.xyaxis.line", "list.dash"]
    
    var body: some View {
        SegmentedControlView(selection: $selection, segmentsCount: 3) { index in
            SegmentControlButton(
                title: titles[index],
                icon: icons[index],
                action: { selection = index }
            )
        }
        Text("Value: \(titles[selection])")
            .font(.largeTitle)
        
        Picker("", selection: $selection) {
            ForEach(0..<titles.count, id: \.self) { index in
                Text(titles[index]).tag(index)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}
