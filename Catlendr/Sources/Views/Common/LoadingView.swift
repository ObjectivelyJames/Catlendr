import SwiftUI

struct LoadingViewConstants {
    static let progressViewScale: CGFloat = 2.0
}

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(LoadingViewConstants.progressViewScale)
    }
}

#Preview {
    LoadingView()
}
