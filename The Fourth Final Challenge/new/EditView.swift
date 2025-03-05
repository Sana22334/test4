
import SwiftUI

struct EditView: View {
    @State var text: String
    @State var fontSize: CGFloat = 18
    @State var backgroundColor: Color = .white
    @AppStorage("recentColors") private var recentColors: [String] = []

    var body: some View {
        VStack {
            ScrollView {
                Text(text)
                    .font(.system(size: fontSize))
                    .padding()
                    .background(backgroundColor)
                    .cornerRadius(12)
            }
            Spacer()

            VStack {
                Slider(value: $fontSize, in: 12...36, step: 1)
                    .padding()
                ColorPicker("اختر لون الخلفية", selection: $backgroundColor)
                    .onChange(of: backgroundColor) { newColor in
                        saveRecentColor(newColor)
                    }
            }
            .padding()
        }
        .navigationTitle("التعديل")
    }

    private func saveRecentColor(_ color: Color) {
        let hex = color.toHex
        if !recentColors.contains(hex) {
            if recentColors.count == 4 {
                recentColors.removeFirst()
            }
            recentColors.append(hex)
        }
    }
}

#Preview {
    EditView(text: "هذا نص تجريبي")
}
