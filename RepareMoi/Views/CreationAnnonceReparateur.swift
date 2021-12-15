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
    //@State private var titreAnnonce = "Titre de votre annonce"
    
    // Description
    @State private var titreAnnonce = "Titre de votre annonce"
    @State private var descriptionProbleme: String = "Description de vos services"
    
    // Pour les toggle
    @State private var statutToggleSemaine = false
    @State private var statutToggleWeekend = false
    @State private var statutToggleUrgent = false
    @State private var typeAppareil = false
    
    // Pour le PickerDate
    @State private var dateLimiteAnnonce = Date()
    
    @ObservedObject var profil: Profil
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color("BaseColor").ignoresSafeArea()
                
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
                    TextEditor(text: $titreAnnonce)
                        .frame(width: 325, height: 50, alignment: .center)
                        .cornerRadius(10)
                        .padding(.trailing)
                        .foregroundColor(.black)
                        .font(Font.system(size: 15, weight: .medium))
                        .padding(7)
                        //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("BaseColor"), lineWidth: 1))
                        //.frame(width: 325, height: 50)
                        .padding(8)
                        .shadow(radius: 5)
                    
                    
                    Spacer()
                    Spacer()
                    //Spacer()
                    //Spacer()
                    
                    Text("Description")
                        .font(.headline)
                        .bold()
                    TextEditor(text: $descriptionProbleme)
                        //.border(Color("GrayCustom"))
                        .frame(width: 325, height: 50, alignment: .center)
                        .cornerRadius(10)
                        .padding(.trailing)
                        .foregroundColor(.black)
                        .font(Font.system(size: 15, weight: .medium))
                        .padding(7)
                        //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("BaseColor"), lineWidth: 1))
                        //.frame(width: 325, height: 50)
                        .padding(8)
                        .shadow(radius: 5)
                    
                    
                    // PICKER TYPE APPAREIL
                    Text("Appareil que vous pouvez réparer")
                        .font(.headline)
                        .bold()
                        .padding()
                     Picker("Type Appareil", selection: $typeAppareil)  {
                     ForEach(AppareilCategory.allCases) { Appareils in
                     Text(Appareils.rawValue.capitalized)
                     .tag(Appareils)
                     
                     
                     }
                     } // Fin Picker
                     .padding()
                     .background(.bar)
                     .background(Color.white)
                     .cornerRadius(15)
                     .cornerRadius(50)
                     .shadow(radius: 5) 
                    
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
                .padding()
                
                    
                
                // Date limite pour l'annonce
                Text("Date limite annonce")
                    .font(.headline)
                    .bold()
                
                DatePicker("Date expiration annonce", selection: $dateLimiteAnnonce, in: Date()...Date().advanced(by: (86400 * 30 * 12) * 20), displayedComponents: .date)
                    .padding()
                
                
                // NAVIGATIONLINK
                NavigationLink(destination: AnnonceUser(profil: profilTest)) {
                    Text("Créer mon annonce")
                }
                .buttonStyle(.borderedProminent)
                
                .padding()
                
                
            }
                
            } // Fin ScrollView
                
                
            .navigationBarTitle("Creation Annonce réparation", displayMode: .inline)
        } // Fin NavigationView
            
        
    } // Fin Body
        
    
} // Fin Struct

struct CreationAnnonceReparateur_Previews: PreviewProvider {
    static var previews: some View {
        CreationAnnonceReparateur(profil: profilTest)
    }
}



