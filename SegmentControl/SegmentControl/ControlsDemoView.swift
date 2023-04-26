import SwiftUI

struct ControlsDemoView: View {
    @State private var selection = 0
    @State private var selectedTab: ResultsTab = .statsAndCharts

    private var titles = ["Results", "History", "Metrics"]
    private var icons = ["chart.bar.fill", "chart.xyaxis.line", "list.dash"]
    
    var body: some View {
        VStack {
            Text("SegmentedControlView")
            SegmentedControlView(selection: $selection, segmentsCount: 3) { index in
                SegmentControlButton(
                    title: titles[index],
                    icon: icons[index],
                    action: { selection = index }
                )
            }
        }
        .padding(20)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.iconButtonBackground, lineWidth: 2)
        )

        VStack {
            Text("ResultsTabSelectorView")
            ResultsTabSelectorView(selectedTab: $selectedTab)
                .onChange(of: selection) { selectedTab = ResultsTab.allCases[$0] }
                .onChange(of: selectedTab) { selection = ResultsTab.allCases.firstIndex(of: $0)! }
                .animation(.easeInOut, value: selectedTab)
        }
        .padding(20)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.iconButtonBackground, lineWidth: 2)
        )

        VStack {
            Text("Swift UI Segmented Control")
            Picker("", selection: $selection) {
                ForEach(0..<titles.count, id: \.self) { index in
                    Text(titles[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding(20)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.iconButtonBackground, lineWidth: 2)
        )

        Text("Value: \(titles[selection])")
            .font(.largeTitle)
    }
}
