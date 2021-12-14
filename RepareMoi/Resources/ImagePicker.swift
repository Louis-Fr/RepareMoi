//
//  ImagePicker.swift
//  RepareMoi
//
//  Created by Apprenant 78 on 14/12/2021.
//

import Foundation
import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var uiImage: UIImage?
    @Binding var imagePickerIsPresenting: Bool
    @Binding var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIImagePickerController
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePicker
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            parent.uiImage = info[.originalImage] as? UIImage
            parent.imagePickerIsPresenting = false
            
            }

            
            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                parent.imagePickerIsPresenting = false
            }
        init(_ imagePicker: ImagePicker) {
            self.parent = imagePicker
        }
    }
}
