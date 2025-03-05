//
//  ContentView.swift
//  challenge6
//
//  Created by saNa on 02/09/1446 AH.
//
import SwiftUI

struct StoryView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            // الخلفية
            Color(hex: "#CFE6EC")
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                // شريط العنوان مع زر الحفظ والرجوع
                HStack {
                    // زر الحفظ
                    Button(action: { saveStory() }) {
                        Image(systemName: "square.and.arrow.down") // أيقونة الحفظ
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 20)

                    Spacer()

                    // العنوان
                    Text("الأصدقاء الذين أصبحوا عائلة")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    Spacer()

                    // زر الرجوع
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "arrow.backward") // أيقونة الرجوع
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    .padding(.trailing, 20)
                }
                .padding(.top, 20)
                .padding(.horizontal)

                Divider()

                // محتوى القصة: صورة على اليسار والنص على اليمين
                HStack(alignment: .center, spacing: -5) { // ✅ تقليل المسافة لتناسب التنسيق
                    Image("Frame 32") // استبدل باسم الصورة لديك
                        .resizable()
                        .scaledToFit()
                        .frame(width: 442.56, height: 860.04) // ✅ ضبط الحجم ليكون
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 5)

                    VStack(alignment: .leading, spacing: 150) { // ✅ تحسين المسافات بين العناصر
                        HStack {
                            // زر الصوت
                            Button(action: { playAudio() }) {
                                Image(systemName: "speaker.wave.2.fill") // أيقونة الصوت
                                    .font(.title2)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)

                        Text("في قرية صغيرة، عاش أربعة أصدقاء...")
                            .font(.title2)
                            .foregroundColor(.black)
                            .frame(width: 492.54, height: 34, alignment: .topTrailing) // ✅
                            .padding(.trailing, 80) // ✅ إضافة مسافة من الحافة اليمنى
                            .padding(.horizontal)
                            .padding(.top, -250)

                        TextEditor(text: .constant("أكمل هنا..."))
                            .foregroundColor(.gray)
                            .frame(width: 87, height: 24.22) // ✅ ضبط الحجم ليكون مناسبًا
                            .multilineTextAlignment(.trailing) // ✅ جعل النص بمحاذاة اليمين
                            .padding(.horizontal)
                            .padding(.top, -340)
                            .frame(maxWidth: .infinity, alignment: .trailing) // ✅ دفع النص لليمين بالكامل
                            .padding(.trailing, -60)

                        // زر الإعادة
                        Button(action: { restartStory() }) {
                            Image(systemName: "arrow.clockwise") // أيقونة الإعادة
                                .font(.title2)
                                .foregroundColor(.gray)
                                .padding() // ✅ مسافة من الحافة اليمنى
                        }
                        .padding(.horizontal)
                    }
                    .frame(width: 442.56, height: 860.04) // ✅ ضبط عرض النص ليكون مناسبًا
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(15)
                    .shadow(radius: 3)
                }
                .padding(.top, 200)

                Spacer()
            }
        }
    }

    func saveStory() {
        print("تم حفظ القصة!")
    }

    func playAudio() {
        print("تشغيل الصوت")
    }

    func restartStory() {
        print("إعادة تشغيل القصة")
    }
}

// امتداد لدعم الألوان باستخدام Hex
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
            .previewInterfaceOrientation(.portrait)
    }
}
