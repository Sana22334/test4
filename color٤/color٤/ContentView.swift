//
//  ContentView.swift
//  color٤
//
//  Created by saNa on 16/06/1446 AH.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("لتغيير النص")
                    .font(.custom("Maqroo-Regular", size: 24)) // استخدام الخط المخصص
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundColor(.blue.opacity(0.9))
                
                // زر الانتقال إلى TextEditorView
                NavigationLink(destination: TextEditorView()) {
                    Text("ابدأ")
                        .font(.custom("Maqroo-Regular", size: 20))
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("النص")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

