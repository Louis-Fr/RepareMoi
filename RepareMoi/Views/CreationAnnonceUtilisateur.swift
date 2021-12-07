//
//  CreationAnnonceUtilisateur.swift
//  RepareMoi
//
//  Created by Apprenant 62 on 03/12/2021.
//

import SwiftUI

struct CreationAnnonceUtilisateur: View {
    
    // IMAGEPICKER
    @State private var showPhotoPickerAnnonce = false
    @State private var annonceImage = UIImage(named: "brokenSmartphoneLow")!
    // TITRE ANNONCE
    @State private var titreAnnonce = "Titre de votre annonce"
    
    // DESCRIPTION
    @State private var descriptionProbleme: String = "Description du problème"
    
    // TOGGLE
    @State private var statutToggleSemaine = false
    @State private var statutToggleWeekend = false
    @State private var statutToggleUrgent = false
    @State private var typeAppareil = ""
    
    
    var body: some View {
        
        NavigationView {
            
        
        
        ScrollView(.vertical) {
            VStack {
                Text("Titre de l'annonce")
                    .font(.headline)
                    .bold()
                    .padding()
                
                TextField("Titre de votre annonce", text: $titreAnnonce)
                    .foregroundColor(.black)
                    .font(Font.system(size: 15, weight: .medium))
                    .padding(8)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    .frame(maxWidth: 300, maxHeight: 15, alignment: .center)
                    .padding()
                
                
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
                    .padding(.trailing)
                    .foregroundColor(.black)
                    .font(Font.system(size: 15, weight: .medium))
                    .padding(7)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    .frame(width: 300, height: 45)
                    .padding(8)
                
                Text("Type d'appareil")
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
                .cornerRadius(15)
                
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
                        .foregroundColor(Color.red)
                        //.frame(width: 0, alignment: .trailing)
                    Toggle("Semaine", isOn: $statutToggleSemaine)
                        .padding()
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    Toggle("Week-end", isOn: $statutToggleWeekend)
                        .padding()
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    
                } // Fin Vstack Disponibilité
            
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
            
            
            NavigationLink(destination: Text("Votre compte est bien créer")) {
                Text("Créer mon annonce")
            }
            //.background(Color.blue)
            .buttonStyle(.borderedProminent)
            
            .padding()
                 
            } // Fin Vtsack ImagePicker
            
            
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


