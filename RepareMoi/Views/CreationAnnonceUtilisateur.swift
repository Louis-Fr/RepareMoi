//
//  CreationAnnonceUtilisateur.swift
//  RepareMoi
//
//  Created by Apprenant 62 on 03/12/2021.
//

import SwiftUI

struct CreationAnnonceUtilisateur: View {
    
    @State private var showPhotoPickerAnnonce = false
    @State private var annonceImage = UIImage(named: "imagepickerProfil")!
    
    @State private var descriptionProbleme: String = "Description du problème"
    @State private var statutToggleSemaine = false
    @State private var statutToggleWeekend = false
    @State private var statutToggleUrgent = false
    @State private var typeAppareil = false
    @State private var titreAnnonce = "Titre de votre annonce"
    
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
                    HStack {
                        //Text("Urgent")
                            //.font(.headline)
                            //.bold()
                            //.frame(maxWidth: 180, maxHeight: 50, alignment: .leading)
                            //.foregroundColor(Color.red)
                        Toggle("Urgent", isOn: $statutToggleUrgent)
                            .padding()
                            .toggleStyle(SwitchToggleStyle(tint: .blue))
                            .foregroundColor(Color.red)
                            //.frame(width: 0, alignment: .trailing)
                    }
                    Toggle("Semaine", isOn: $statutToggleSemaine)
                        .padding()
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    Toggle("Week-end", isOn: $statutToggleWeekend)
                        .padding()
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                   /* Toggle("Tablette", isOn: $statutToggle)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                        .padding()
                    Toggle("Autre", isOn: $statutToggle)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                        .padding() */
                    
                } // Fin Vstack Compétences
            
            VStack { // 1ére Etape ajout image
                Image(uiImage: annonceImage)
                    .resizable() // Pour redimensionner l'image
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                // 2éme Etape
                    .onTapGesture { showPhotoPickerAnnonce = true }
                
            
            .sheet(isPresented: $showPhotoPickerAnnonce, content: {
                photoPickerAnnonce(annonceImage: $annonceImage)
            })
            
            }
            
            NavigationLink(destination: Text("Votre compte est bien créer")) {
                Text("Créer mon annonce")
            }
            //.background(Color.blue)
            .buttonStyle(.borderedProminent)
            
            .padding()
                 
            
            
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

