//
//  photoPicker.swift
//  addImagePicker
//
//  Created by Louis REY on 04/12/2021.
//

import SwiftUI

struct photoPickerAnnonce: UIViewControllerRepresentable {
    
    @Binding var annonceImage: UIImage
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPickerAnnonce: self)
    }
    //typealias UIViewControllerType = UIImagePickerController
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let photoPickerAnnonce: photoPickerAnnonce
        
        init(photoPickerAnnonce: photoPickerAnnonce){
            self.photoPickerAnnonce = photoPickerAnnonce
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                photoPickerAnnonce.annonceImage = image
            } else {
                // return an error show an alert
            }
            picker.dismiss(animated: true)
        }
    }
}


