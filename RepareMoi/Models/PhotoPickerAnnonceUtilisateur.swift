//
//  photoPicker.swift
//  addImagePicker
//
//  Created by Louis REY on 04/12/2021.
//

import SwiftUI

struct photoPickerAnnonceUtilisateur: UIViewControllerRepresentable {
    
    @Binding var imageProfil: UIImage
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPickerAnnonceUtilisateur: self)
    }
    //typealias UIViewControllerType = UIImagePickerController
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let photoPickerAnnonceUtilisateur: photoPickerAnnonceUtilisateur
        
        init(photoPickerAnnonceUtilisateur: photoPickerAnnonceUtilisateur){
            self.photoPickerAnnonceUtilisateur = photoPickerAnnonceUtilisateur
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                photoPickerAnnonceUtilisateur.imageProfil = image
            } else {
                // return an error show an alert
            }
            picker.dismiss(animated: true)
        }
    }
}




