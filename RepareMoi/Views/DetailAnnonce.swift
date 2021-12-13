//
//  DetailAnnonce.swift
//  RepareMoi
//
//  Created by Louis REY on 08/12/2021.
//

import SwiftUI

struct DetailAnnonce: View {
    
    @State private var showPhotoPickerAnnonce = false
    @State private var annonceImage = UIImage(named: "brokenSmartphoneLow")!
    
    @State private var description = "Description de l'utilisateur qu'il faut récupérer depuis creation Annonce OU annnonce utilistaeur / reparateur"
    
    var body: some View {
        
        ZStack {
            Color("BaseColor")
                .ignoresSafeArea()
            
            // Récupérer image ajouter par l'utilisateur via ImagePicker
            
            VStack {
                Text("* Ajouter titre de l'annonce *")
                    .font(Font.system(size: 18, weight: .medium))
                    
                Image(uiImage: annonceImage)
                    .resizable()
                    .frame(width: 300, height: 200)
                    .scaledToFill()
                    .cornerRadius(15)
                    .onTapGesture { showPhotoPickerAnnonce = true }
                
            
            .sheet(isPresented: $showPhotoPickerAnnonce, content: {
                photoPickerAnnonce(annonceImage: $annonceImage)
            })
            .padding(25)
                
                
            Text("* Description de l'annonce *")
            .font(Font.system(size: 18, weight: .medium))
            
                
            TextEditor(text: $description)
            .cornerRadius(10)
            //.padding(.center)
            .foregroundColor(.black)
            .font(Font.system(size: 15, weight: .medium))
            .padding(7)
            //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("BaseColor"), lineWidth: 1))
            .frame(width: 325, height: 100)
            .padding(15)
                
                Text("* Disponibilité *")
                    .font(.headline)
                    .bold()
                // Récupérer le statut du toggle
                
                Spacer()
                    .frame(height: 180)
                
                
                Button(action: {
                    print("Appareil ajouté")
                }) {
                    Text("Répondre à l'annonce")
                        .padding(15)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .background(.bar)
                        .cornerRadius(50)
                }
                
                
                
                
                
                
                
                
                
                
                
                
            }
            
            
            
            
            
            
            
        } // Fin Vstack
        
        
    }
}

struct DetailAnnonce_Previews: PreviewProvider {
    static var previews: some View {
        DetailAnnonce()
    }
}
