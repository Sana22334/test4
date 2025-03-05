
import SwiftUI
import AVFoundation

struct TextReaderView: View {
    var text: String
    private let synthesizer = AVSpeechSynthesizer()

    var body: some View {
        VStack {
            ScrollView {
                Text(text)
                    .padding()
            }
            Button(action: {
                speakText(text)
            }) {
                HStack {
                    Image(systemName: "speaker.wave.2")
                    Text("استمع للنص")
                }
                .padding()
                .background(Color.blue.opacity(0.2))
                .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle("قراءة النص")
    }

    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ar-SA")
        synthesizer.speak(utterance)
    }
}

#Preview {
    TextReaderView(text: "هذا النص سيتم قراءته")
}
