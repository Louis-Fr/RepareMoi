//
//  CreationAnnonceUtilisateur.swift
//  RepareMoi
//
//  Created by Apprenant 62 on 03/12/2021.
//

import SwiftUI

struct CreationProfil: View {
    
    @State private var name: String = "Nom Prenom"
    @State private var description: String = "Presentez-vous"
    @State private var statutToggleOrdinateur = false
    @State private var statutToggleSmartphone = false
    @State private var statutToggleTablette = false
    @State private var statutToggleAutre = false
    
    @State private var city = ["Londres", "Nancy", "Lille"]
    @State private var selectedPickerCity = "Paris"
    
    
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    
                    Text("Informations")
                        .font(.headline)
                        .bold()
                    TextField("nom prenom", text: $name)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                        .foregroundColor(.gray)
                    TextField("description", text: $description)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                        .foregroundColor(.gray)
                        .lineLimit(6)
                    
                    Spacer()
                    Spacer()
                    
                    VStack {
                        Text("Compétences")
                            .font(.headline)
                            .bold()
                        Toggle("Ordinateur", isOn: $statutToggleOrdinateur)
                            .padding()
                            .toggleStyle(SwitchToggleStyle(tint: .blue))
                        Toggle("Smartphone", isOn: $statutToggleSmartphone)
                            .padding()
                            .toggleStyle(SwitchToggleStyle(tint: .blue))
                        Toggle("Tablette", isOn: $statutToggleTablette)
                            .toggleStyle(SwitchToggleStyle(tint: .blue))
                            .padding()
                        Toggle("Autre", isOn: $statutToggleAutre)
                            .toggleStyle(SwitchToggleStyle(tint: .blue))
                            .padding()
                        
                        
                        Text("Votre Localisation")
                            .font(.headline)
                            .bold()
                        Picker("Londres", selection: $selectedPickerCity, content: {
                            Text("Londres")
                            Text("Paris")
                            Text("Lyon")
                            Text("Londres")
                            Text("Paris")
                            Text("Lyon")
                            Text("Londres")
                            Text("Paris")
                            Text("Lyon")
                            
                        }) // Fin Picker
                            .padding()
                            .background(.bar)
                            .cornerRadius(50)
                        
                        
                        // Style le Picker
                        
                        
                        
                        
                        
                            .navigationTitle("Création Profil")
                        
                    } // Fin Vtsack Compétences
                    
                } // Fin Vstack Informations
            } // Fin Navigation View
        } // Fin ScrollView
    } // Fin Body
    
} // Fin View



struct CreationProfil_Previews: PreviewProvider {
    static var previews: some View {
        CreationProfil()
    }
}



