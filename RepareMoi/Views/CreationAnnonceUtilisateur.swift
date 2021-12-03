//
//  CreationAnnonceUtilisateur.swift
//  RepareMoi
//
//  Created by Apprenant 62 on 03/12/2021.
//

import SwiftUI

struct CreationAnnonceUtilisateur: View {
    @State private var description: String = "Description du problème"
    @State private var statutToggle = true
    
    var body: some View {
        
        
        ScrollView(.vertical) {
            VStack {
                Text("Description")
                    .font(.headline)
                    .bold()
                TextField("Description", text: $description)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .foregroundColor(.gray)
                
                
                
                VStack {
                    Text("Compétences")
                        .font(.headline)
                        .bold()
                    Toggle("Ordinateur", isOn: $statutToggle)
                        .padding()
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    Toggle("Smartphone", isOn: $statutToggle)
                        .padding()
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    Toggle("Tablette", isOn: $statutToggle)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                        .padding()
                    Toggle("Autre", isOn: $statutToggle)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                        .padding()
                    
                } // Fin Vstack 2
                
            }
        } // Fin Vstack 1
        
    }
}

struct CreationAnnonceUtilisateur_Previews: PreviewProvider {
    static var previews: some View {
        CreationAnnonceUtilisateur()
    }
}

