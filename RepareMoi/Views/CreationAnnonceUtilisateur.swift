//
//  CreationAnnonceUtilisateur.swift
//  RepareMoi
//
//  Created by Apprenant 62 on 03/12/2021.
//

import SwiftUI

struct CreationAnnonceUtilisateur: View {
    
    // IMAGEPICKER
    
    @State private var statutPhoto = false
    @State private var imageProfil = UIImage(named: "imagepickerProfil")!
    
    @State private var showPhotoPickerAnnonce = false
    @State private var annonceImage = UIImage(named: "brokenSmartphoneLow")!
    
    //@State private var statutPhoto = false
    //@State private var imageProfil = UIImage(named: "default-avatar")!
    
    // TITRE ANNONCE
    //@State private var titreAnnonce = "Titre de votre annonce"
    
    // DESCRIPTION
    @State private var titreAnnonce = "Titre de votre annonce"
    @State private var descriptionProbleme: String = "Description du problème"
    
    // TOGGLE
    @State private var statutToggleSemaine = false
    @State private var statutToggleWeekend = false
    @State private var statutToggleUrgent = false
    //@State private var typeAppareil = false
    
    
    var body: some View {
        
        
        
        NavigationView {
            
            ZStack {
                Color("BaseColor")
                    .ignoresSafeArea()
           
        
        ScrollView(.vertical) {
            VStack {
                
                VStack {
                    Text("Nom du profil")
                        .font(.headline)
                        .bold()
                    
                    Image(uiImage: imageProfil)
                        .resizable()
                        .scaledToFill()// Pour redimensionner l'image
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                    
                    // 2éme Etape
                        .onTapGesture { statutPhoto = true }
                    
                    
                        .sheet(isPresented: $statutPhoto, content: {
                            photoPickerAnnonceUtilisateur(imageProfil: $imageProfil)
                        })
                        .padding()
                    }
                
                
                
                
               /* Text("Titre de l'annonce")
                    .font(.headline)
                    .bold()
                    .padding()
                
                
                TextField("Titre de votre annonce", text: $titreAnnonce)
                    .cornerRadius(50)
                    .foregroundColor(.black)
                    .font(Font.system(size: 15, weight: .medium))
                    .padding(8)
                    //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    .frame(maxWidth: 300, maxHeight: 15, alignment: .center)
                    .padding() */
                
                Text("Titre annonce")
                    .font(.headline)
                    .bold()
                TextEditor(text: $titreAnnonce)
                    .cornerRadius(10)
                    .padding(.trailing)
                    .foregroundColor(.black)
                    .font(Font.system(size: 15, weight: .medium))
                    .padding(7)
                    //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("BaseColor"), lineWidth: 1))
                    .frame(width: 325, height: 50)
                    .padding(8)
                    
                
                
               /* Text("Type d'appareil")
                    .font(.headline)
                    .bold()
                    .padding()
                Picker("Type Appareil", selection: $typeAppareil)  {
                    ForEach(AppareilCategory.allCases) { Appareils in
                        Text(Appareils.rawValue.capitalized)
                            .tag(Appareils)
                            
                            
                    }
                    /*
                    .background(.bar)
                     */

                } // Fin Picker */
                /* .padding(15)
                .background(.bar)
                .cornerRadius(15) */
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                    
                Text("Description")
                    .font(.headline)
                    .bold()
                TextEditor(text: $descriptionProbleme)
                    .frame(width: 325, height: 50, alignment: .center)
                    .cornerRadius(10)
                    .padding(.trailing)
                    .foregroundColor(.black)
                    .font(Font.system(size: 15, weight: .medium))
                    .padding(7)
                    //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("BaseColor"), lineWidth: 1))
                    //.frame(width: 325, height: 50)
                    .padding(8)
              
                
                /* Text("Type d'appareil")
                    .font(.headline)
                    .bold()
                    .padding()
                 Picker("Type Appareil", selection: $typeAppareil)  {
                    ForEach(AppareilCategory.allCases) { Appareils in
                        Text(Appareils.rawValue.capitalized)
                            .tag(Appareils)
                            
                            
                    }
                } // Fin Picker
                .padding(15)
                .background(Color("BaseColor"))
                .background(.bar)
                .cornerRadius(15) */
                   
                
            } // Fin Vstack Description 
                
                
            
            .padding()
            
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
                
                VStack {
                    
                    
                    Text("Disponibilité")
                        .font(.headline)
                        .bold()
                    
                    Toggle("Urgent", isOn: $statutToggleUrgent)
                        .padding()
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    Toggle("Semaine", isOn: $statutToggleSemaine)
                        .padding()
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    Toggle("Week-end", isOn: $statutToggleWeekend)
                        .padding()
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    
                } // Fin Vstack Disponibilité
                .padding()
            
            // ImagePicker
           VStack {
                Text("Ajouter une photo")
                    .font(.headline)
                    .bold()
                    
                Image(uiImage: annonceImage)
                    .resizable()
                    .frame(width: 300, height: 200)
                    .scaledToFill()
                    .cornerRadius(15)
                    .onTapGesture { showPhotoPickerAnnonce = true }
                
            
            .sheet(isPresented: $showPhotoPickerAnnonce, content: {
                photoPickerAnnonce(annonceImage: $annonceImage)
            })
            .padding()
            
            .foregroundColor(Color("BaseColor"))
            NavigationLink(destination: AnnonceUser(profil: profilTest)) {
                Text("Créer mon annonce")
            }
               
            //.background(Color.blue)
            .buttonStyle(.borderedProminent)
            
            .padding()
                 
            } // Fin Vtsack ImagePicker
            
        } // Fin Ztasck Color
            
        } // Fin ScrollView
        .navigationBarTitle("Creation Annonce réparation", displayMode: .inline)
        } // Fin NavigationView
       
        
    } // Fin Body
    
    
} // Fin Struct


struct CreationAnnonceUtilisateur_Previews: PreviewProvider {
    static var previews: some View {
        CreationAnnonceUtilisateur()
    }
}


