import SwiftUI

private struct LoadingKey: EnvironmentKey {
    static let defaultValue = false
}

extension EnvironmentValues {
    var isLoading: Bool {
        get { self[LoadingKey.self] }
        set { self[LoadingKey.self] = newValue }
    }
}

extension View {
    func loading(_ loading: Bool) -> some View {
        self
            .environment(\.isLoading, loading)
            .disabled(loading)
    }
}
