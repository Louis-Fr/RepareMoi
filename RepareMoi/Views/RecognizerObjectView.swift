//
//  RecognizerObjectView.swift
//  RepareMoi
//
//  Created by Apprenant 78 on 14/12/2021.
//

import SwiftUI

struct RecognizerObjectView: View {
    @State var imagePickerIsPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        
        VStack {
            HStack {
                Image(systemName: "photo")
                    .onTapGesture {
                        imagePickerIsPresenting = true
                    }
                Image(systemName: "camera")
            }
            .font(.largeTitle)
        .foregroundColor(.blue)
            
            Rectangle()
                .strokeBorder()
                .foregroundColor(.black)
                .overlay(
                    Group {
                        if uiImage != nil {
                            Image(uiImage: uiImage!)
                                .resizable()
                                .scaledToFit()
                        } else {
                            
                            ZStack {
                                Rectangle()
                                    .frame(width: 350,height: 260)
                                .foregroundColor(.gray)
                                Text("Importez votre image")
                                    .font(.title)
                            }
                        }
                    }
                )
            VStack {
            Button(action: {
                if uiImage != nil {
                    classifier.detect(uiImage: uiImage!)
                }
            }) {
                Image(systemName: "info.circle")
                                    .foregroundColor(.red)
                                    .font(.title)
            }
            
            Group {
                if let imageClass = classifier.imageClass {
                    HStack {
                        Text("La catégorie de l'image :")
                            .font(.system(size: 20)).multilineTextAlignment(.leading)
                        Text(imageClass)
                            .bold()
                    }
                } else {
                    HStack {
                        Text("Importe une image pour voir la catégorie")
                            .font(.title).multilineTextAlignment(.center)
                    }
                }
            }
//            .font(.subheadline)
            .padding()
            }
            
        }
        .sheet(isPresented: $imagePickerIsPresenting) {
            ImagePicker(uiImage: $uiImage, imagePickerIsPresenting: $imagePickerIsPresenting, sourceType: $sourceType)
                .onDisappear {
                    if uiImage != nil {
                        classifier.detect(uiImage: uiImage!)
                    }
                }
        }
        .padding()
    }
}

struct RecognizerObjectView_Previews: PreviewProvider {
    static var previews: some View {
        RecognizerObjectView(classifier: ImageClassifier())
    }
}
