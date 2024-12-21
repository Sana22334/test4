import SwiftUI
import AVFoundation

struct TextEditorView: View {
    @State private var text: String = "هذا النص بمثابة نص يظهر للمستخدم"
    @State private var backgroundColor: Color = .white // Current applied background color
    @State private var fontSize: CGFloat = 18 // Current applied font size
    @State private var savedColors: [Color] = [.blue, .red, .gray, .green] // Default saved colors
    @State private var isSpeaking: Bool = false
    @State private var isEditing: Bool = true // Toggle for edit/view mode

    private let speechSynthesizer = AVSpeechSynthesizer()

    var body: some View {
        VStack {
            if isEditing {
                VStack {
                    Spacer()

                    // Editable Text Area
                    TextEditor(text: $text)
                        .font(.system(size: fontSize))
                        .foregroundColor(.black)
                        .background(backgroundColor)
                        .cornerRadius(10)
                        .padding()
                        .frame(height: 300)

                    Spacer()

                    // Controls
                    EditorControlsView(
                        fontSize: $fontSize,
                        backgroundColor: $backgroundColor,
                        savedColors: $savedColors,
                        onSave: {
                            isEditing = false
                        }
                    )
                }
            } else {
                VStack(spacing: 20) {
                    // Text Area after applying settings
                    TextEditor(text: $text)
                        .font(.system(size: fontSize))
                        .foregroundColor(.black)
                        .background(backgroundColor)
                        .cornerRadius(10)
                        .padding()
                        .frame(height: 300)

                    Spacer()

                    HStack {
                        // Play/Stop Audio Button
                        Button(action: toggleAudio) {
                            Image(systemName: isSpeaking ? "speaker.slash.fill" : "speaker.fill")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                        }

                        Spacer()

                        // Back to Edit Button
                        Button(action: {
                            isEditing = true
                        }) {
                            Text("رجوع")
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(width: 100, height: 50)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                }
            }
        }
        .padding()
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
    }

    private func toggleAudio() {
        if isSpeaking {
            speechSynthesizer.stopSpeaking(at: .immediate)
        } else {
            let utterance = AVSpeechUtterance(string: text)
            utterance.voice = AVSpeechSynthesisVoice(language: "ar-SA")
            speechSynthesizer.speak(utterance)
        }
        isSpeaking.toggle()
    }
}

struct EditorControlsView: View {
    @Binding var fontSize: CGFloat
    @Binding var backgroundColor: Color
    @Binding var savedColors: [Color]
    var onSave: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("تعديل النص والخلفية")
                .font(.headline)
                .padding(.top)

            // Font Size Adjustment
            HStack {
                Text("A-")
                    .font(.headline)
                Slider(value: $fontSize, in: 12...30, step: 1)
                Text("A+")
                    .font(.headline)
            }
            .padding(.horizontal)

            // Background Color Selection
            HStack {
                // Color Picker
                ColorPicker("", selection: $backgroundColor)
                    .frame(width: 40, height: 40)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 2)

                // Saved Colors
                ForEach(savedColors, id: \.self) { color in
                    Circle()
                        .fill(color)
                        .frame(width: 40, height: 40)
                        .onTapGesture {
                            backgroundColor = color
                        }
                        .shadow(radius: 2)
                }
            }
            .padding(.horizontal)

            // Save Button
            Button(action: onSave) {
                Text("حفظ الإعدادات")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 150, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.top)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TextEditorView()
        }
    }
}

