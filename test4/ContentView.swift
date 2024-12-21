//
//  ContentView.swift
//  test4
//
//  Created by saNa on 16/06/1446 AH.
//

import SwiftUI
import UIKit

// ربط TextEditorViewController (UIKit) مع SwiftUI
struct TextEditorViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> TextEditorViewController {
        return TextEditorViewController()
    }
    
    func updateUIViewController(_ uiViewController: TextEditorViewController, context: Context) {
    }
}

struct ContentView: View {
    var body: some View {
        TextEditorViewControllerWrapper() // عرض الـ ViewController هنا
            .edgesIgnoringSafeArea(.all) // تأخذ كامل الشاشة
    }
}

#Preview {
    ContentView()
}
