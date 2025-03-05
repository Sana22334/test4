//
//  StoryView1.swift
//  hekayti
//
//  Created by saNa on 04/09/1446 AH.
//
import SwiftUI

struct StoryView1: View {
    @State private var userText: String = ""
    private let maxLines = 24

    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex:"CFE6EC")
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
                                       Text("الاصدقاء الذين اصبحو عائله")
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
                                       Image("Frame 32")
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
                                               Text("في قرية صغيرة، عاش أربعة أصدقاء .....")
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
                                                   .frame(width: 40, height: 40)
                                                   .foregroundColor(.black)
                                                   .padding()
                                               Spacer().frame(width:400)
                                           }
                                           .padding(.bottom, 20)
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

               #Preview {
                   StoryView1()
               }

