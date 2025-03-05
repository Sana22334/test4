//
//  Untitled.swift
//  new2
//
//  Created by saNa on 24/06/1446 AH.
//
import SwiftUI

struct HomeView: View {
    @State private var showScanner = false
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var scannedText = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Spacer()
                Button(action: {
                    showScanner = true
                }) {
                    HStack {
                        Image(systemName: "doc.text.viewfinder")
                            .font(.largeTitle)
                        Text("مسح النصوص")
                            .font(.title2)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(12)
                }
                .sheet(isPresented: $showScanner) {
                    }
                }

                Button(action: {
                    showImagePicker = true
                }) {
                    HStack {
                        Image(systemName: "photo")
                            .font(.largeTitle)
                        Text("اختيار من الألبوم")
                            .font(.title2)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(12)
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(selectedImage: $selectedImage) { image in
                        // معالجة الصورة وتحويلها إلى نص
                    }
                }

                NavigationLink(destination: HistoryView()) {
                    Text("السجل")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                }
                Spacer()
            }
            .navigationTitle("الرئيسية")
        }
    }
}

#Preview {
    HomeView()
}

