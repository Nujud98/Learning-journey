import SwiftUI

struct DurationButton: View {
    var title: String
    @Binding var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(isSelected ? .black : .orange)
                .background(isSelected ? Color.orange : Color.gray.opacity(0.3))
                .cornerRadius(10)
        }
    }
}
