//
//  CreationAnnonceUtilisateur.swift
//  RepareMoi
//
//  Created by Apprenant 62 on 03/12/2021.
//

import SwiftUI

struct CreationAnnonceReparateur: View {
    
    // ImagePicker
    @State private var showPhotoPickerAnnonce = false
    @State private var annonceImage = UIImage(named: "default-avatar")!
    
    // Titre annonce
    @State private var titreAnnonce = "Titre de votre annonce"
    
    // Description
    @State private var descriptionProbleme: String = "Description de vos services"
    
    // Pour les toggle
    @State private var statutToggleSemaine = false
    @State private var statutToggleWeekend = false
    @State private var statutToggleUrgent = false
    @State private var typeAppareil = false
    
    // Pour le PickerDate
    @State private var dateLimiteAnnonce = Date()
    
    var body: some View {
        
        NavigationView {
            
            
            
            ScrollView(.vertical) {
                VStack {
                    
                    VStack { // IMAGEPICKER
                        
                        Text("Nom du profil")
                            .font(.headline)
                            .bold()
                        
                        Image(uiImage: annonceImage)
                            .resizable()
                            .scaledToFill()// Pour redimensionner l'image
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                        
                        // 2éme Etape
                            .onTapGesture { showPhotoPickerAnnonce = true }
                        
                        
                            .sheet(isPresented: $showPhotoPickerAnnonce, content: {
                                photoPickerAnnonce(annonceImage: $annonceImage)
                            })
                            .padding()
                        
                    } // FIN IMAGEPICKER
                    
                    
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
                    
                    // PICKER TYPE APPAREIL
                    Text("Type d'appareil")
                        .font(.headline)
                        .bold()
                        .padding()
                    /* Picker("Type Appareil", selection: $typeAppareil)  {
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
                    
                    Toggle("Semaine", isOn: $statutToggleSemaine)
                        .padding()
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    Toggle("Week-end", isOn: $statutToggleWeekend)
                        .padding()
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    
                } // Fin Vstack
                
                // Date limite pour l'annonce
                Text("Date limite annonce")
                    .font(.headline)
                    .bold()
                
                DatePicker("Date expiration annonce", selection: $dateLimiteAnnonce, in: Date()..., displayedComponents: .date)
                    .padding()
                
                
                // NAVIGATIONLINK
                NavigationLink(destination: Text("Votre compte est bien créer")) {
                    Text("Créer mon annonce")
                }
                .buttonStyle(.borderedProminent)
                
                .padding()
                
                
                
                
            } // Fin ScrollView
            .navigationBarTitle("Creation Annonce réparation", displayMode: .inline)
        } // Fin NavigationView
        
    } // Fin Body
    
} // Fin Struct

struct CreationAnnonceReparateur_Previews: PreviewProvider {
    static var previews: some View {
        CreationAnnonceReparateur()
    }
}



