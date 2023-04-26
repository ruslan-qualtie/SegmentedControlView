import SwiftUI

struct ResultsTabSelectorView: View {
    @Binding var selectedTab: ResultsTab

    var body: some View {
        HStack(spacing: 0) {
            SegmentButton(
                title: "Results",
                icon: "chart.bar.fill",
                isSelected: selectedTab == .statsAndCharts,
                action: showStatsAndCharts
            )
            SegmentButton(
                title: "History",
                icon: "chart.xyaxis.line",
                isSelected: selectedTab == .history,
                action: showHistory
            )
            SegmentButton(
                title: "Metrics",
                icon: "list.dash",
                isSelected: selectedTab == .metrics,
                action: showMetrics
            )
        }
        .background(
            RoundedRectangle(cornerRadius: 8.0, style: .circular)
                .stroke(Color.iconButtonBackground, lineWidth: 2)
                .padding(1)
        )
    }

    private func showStatsAndCharts() {
        selectedTab = .statsAndCharts
    }
    
    private func showHistory() {
        selectedTab = .history
    }

    private func showMetrics() {
        selectedTab = .metrics
    }
}

#if DEBUG
public struct ResultsTabSelectorView_Previews: PreviewProvider {
    public static var previews: some View {
        PreviewContainer([
            ResultsTabSelectorView(selectedTab: .constant(.statsAndCharts)),
            ResultsTabSelectorView(selectedTab: .constant(.history)),
            ResultsTabSelectorView(selectedTab: .constant(.metrics))
        ], itemSize: .init(width: 330, height: 44))
    }
}
#endif

