//
//  StoryView3.swift
//  hekayti
//
//  Created by saNa on 04/09/1446 AH.
//
import SwiftUI

struct StoryView4: View {
    @State private var userText: String = ""
    private let maxLines = 24

    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "CFE6EC")
                    .edgesIgnoringSafeArea(.all)

                VStack {
                                   // شريط الأدوات العلوي
                                   HStack {
                                       // زر الحفظ (بدون وظيفة)
                                       Button(action: {}) {
                                           Text("حفظ")
                                               .font(.custom("Cairo", size: 20))
                                               .foregroundColor(.black)
                                           Image("Gallery Download")
                                               .resizable() // عشان الصورة تتغير بحجمها
                                               .frame(width: 20, height: 20)
                                               .font(.caption)
                                               .foregroundColor(.black)
                                               .padding()
                                              
                                               
                                       }
                                       Spacer()
                                       
                                       // عنوان القصة
                                       Text("النمر الذي أصبح نجمًا في العالم")
                                           .font(.headline)
                                           .fontWeight(.bold)
                                           .foregroundColor(.black)
                                           .padding(.vertical)                                        .bold()

                                       
                                       Spacer()
                                       
                                       // زر الرجوع للصفحة الرئيسية
                                       Button(action: {
                                           // التنقل للصفحة الرئيسية
                                           // يتم التعامل مع التنقل في NavigationStack مباشرة
                                       }) {
                                           Text("الرجوع")
                                               .font(.custom("Cairo", size: 20))
                                               .foregroundColor(.black)
                                           Image("Play")
                                               .resizable() // عشان الصورة تتغير بحجمها
                                               .frame(width: 20, height: 20)
                                               .foregroundColor(.black)
                                               .padding()
                                              
                                          
                                       }
                                   }
                                   .padding([.horizontal, .top])
                                   
                                   Spacer()
                                   
                                   HStack(spacing: -4) {
                                       // الصورة الكبيرة
                                       Image("Frame 327")
                                           .resizable()
                                           .scaledToFit()
                                           .frame(width: 436.06, height: 858.29)
                                           .cornerRadius(20)
                                       
                                       // الجهة البيضاء مع النصوص
                                       VStack() {
                                           HStack {
                                               // زر الصوت (بدون وظيفة)
                                               Button(action: {}) {
                                                   Image("spek")
                                                       .resizable() // عشان الصورة تتغير بحجمها
                                                       .frame(width: 50, height: 50)
                                                       .foregroundColor(.black)
                                                       .padding()
                                                      
                                               }
                                               Text("في غابة كثيفة، كان هناك نمر يُدعى ......")
                                                   .font(.custom("Cairo", size: 20))
                                                   .foregroundColor(.black)
                                                   .bold()
                                                   .multilineTextAlignment(.trailing) }
                                           Spacer().frame(height:-20)
                                           // النص الثابت وجزء الكتابة
                                           VStack() {
                                             

                                               // مكان الكتابة مع الحد الأقصى للأسطر
                                               ZStack(alignment: .topLeading) {
                                                   TextEditor(text: $userText)
                                                       .font(.custom("Cairo", size: 20))
                                                       .bold()
                                                       .multilineTextAlignment(.trailing)
                                                       .foregroundColor(.black)
                                                       .frame(height: min(CGFloat(maxLines) * 24, 200))
                                                       .background(Color.white)
                                                       .cornerRadius(8)
                                                       
                                                   
                                                   // النص الرمادي "اكتب هنا"
                                                   if userText.isEmpty {
                                                       Text("اكتب هنا...")
                                                           .bold()
                                                           .font(.custom("Cairo", size: 20))
                                                           .foregroundColor(.gray)
                                                           .padding(.horizontal, 40)
                                                           .padding(.vertical, 12).frame(maxWidth: .infinity, alignment: .trailing)
                                                   }
                                               }
                                           }
                                           .padding(.vertical, 10)
                                           
                                           Spacer().frame(width:80)
                                           
                                           // زر الإعادة (مسح النص)
                                           Button(action: {
                                               userText = ""
                                           }) {
                                               Image("agen")
                                                   .resizable() // عشان الصورة تتغير بحجمها
                                                   .frame(width: 50, height: 50)
                                                   .foregroundColor(.black)
                                                   .padding()
                                               Spacer().frame(width:400)
                                           }
                                           .padding(.bottom, 10)
                                       }
                                       .padding()
                                       .frame(width:558.52,height:840)
                                       .background(Color.white)
                                       .clipShape(CustomCornerShape(corners: [.topRight, .bottomRight], radius: 20))
                                   }
                                   .padding(.horizontal, 20)
                   
                    Spacer()
                }
            }
        }
    }
}

// شكل مخصص للحواف المستديرة
struct CustomCornerShape: Shape {
    var corners: UIRectCorner
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

// توسيع Color لدعم الأكواد الست عشرية بشكل آمن
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgb: UInt64 = 0

        if scanner.scanHexInt64(&rgb) {
            let red = Double((rgb & 0xFF0000) >> 16) / 255.0
            let green = Double((rgb & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgb & 0x0000FF) / 255.0

            self.init(red: red, green: green, blue: blue)
        } else {
            self.init(white: 0.8) // لون افتراضي في حالة الخطأ
        }
    }
}

// نقطة البداية للتطبي
#Preview {
    StoryView4()
}

