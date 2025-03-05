//
//  ImagePicker.swift.swift
//  new
//
//  Created by saNa on 24/06/1446 AH.
//
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    var completion: (UIImage?) -> Void

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(selectedImage: $selectedImage, completion: completion)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var selectedImage: UIImage?
        var completion: (UIImage?) -> Void

        init(selectedImage: Binding<UIImage?>, completion: @escaping (UIImage?) -> Void) {
            self._selectedImage = selectedImage
            self.completion = completion
        }
    }
}
