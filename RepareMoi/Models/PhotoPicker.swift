//
//  photoPicker.swift
//  addImagePicker
//
//  Created by Louis REY on 04/12/2021.
//

import SwiftUI

struct photoPicker: UIViewControllerRepresentable {
    
    @Binding var avatarImage: UIImage
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }
    //typealias UIViewControllerType = UIImagePickerController
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let photoPicker: photoPicker
        
        init(photoPicker: photoPicker){
            self.photoPicker = photoPicker
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                photoPicker.avatarImage = image
            } else {
                // return an error show an alert
            }
            picker.dismiss(animated: true)
        }
    }
}

