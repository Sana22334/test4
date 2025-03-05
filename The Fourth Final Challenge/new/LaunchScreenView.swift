//
//  ContentView.swift
//  new
//
//  Created by saNa on 24/06/1446 AH.
//
import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image(systemName: "eye.circle.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.blue)
                Text("رؤيا")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                Spacer()
                NavigationLink(destination: HomeView.swift.swift.()) { // التأكد من اسم الصفحة هنا
                    Text("ابدأ الآن")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    LaunchScreenView()
}
