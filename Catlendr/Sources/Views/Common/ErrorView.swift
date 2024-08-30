import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    
    var body: some View {
        Text(errorMessage)
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
    }
}

#Preview {
    ErrorView(errorMessage: "Error")
}
