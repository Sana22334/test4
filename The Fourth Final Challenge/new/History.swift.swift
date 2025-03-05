
import SwiftUI

struct HistoryView: View {
    @State private var history: [String] = ["النص الأول", "النص الثاني", "النص الثالث"]

    var body: some View {
        List(history, id: \.self) { text in
            NavigationLink(destination: TextReaderView(text: text)) {
                Text(text)
                    .lineLimit(1)
            }
        }
        .navigationTitle("السجل")
    }
}

#Preview {
    HistoryView()
}
