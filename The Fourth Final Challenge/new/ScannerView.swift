//
//  ScannerView.swift
//  new
//
//  Created by saNa on 24/06/1446 AH.
//
import SwiftUI
import VisionKit

struct ScannerView: UIViewControllerRepresentable {
    var completion: (String?) -> Void

    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let controller = VNDocumentCameraViewController()
        controller.delegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(completion: completion)
    }

    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        var completion: (String?) -> Void

        init(completion: @escaping (String?) -> Void) {
            self.completion = completion
        }

        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            var recognizedText = ""
            // معالجة النصوص من المسح
            completion(recognizedText)
        }
    }
}

