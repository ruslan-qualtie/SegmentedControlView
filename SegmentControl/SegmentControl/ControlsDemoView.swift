import SwiftUI

struct ControlsDemoView: View {
    @State private var selection = 0

    private var titles = ["Results", "History", "Metrics"]
    private var icons = ["chart.bar.fill", "chart.xyaxis.line", "list.dash"]
    
    var body: some View {
        SegmentedControlView(selection: $selection, segmentsCount: 3) { index in
            Button(action: { selection = index }) {
                Image(systemName: icons[index])
                Text(titles[index])
            }
            .font(.system(size: 16))
            .foregroundColor(.iconButtonTitle)
            .frame(width: 116, height: 44)
            .buttonStyle(.plain)
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
