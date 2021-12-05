//
//  CreationAnnonceUtilisateur.swift
//  RepareMoi
//
//  Created by Apprenant 62 on 03/12/2021.
//

import SwiftUI

struct CreationAnnonceUtilisateur: View {
    
    @State private var descriptionProbleme: String = "Description du problème"
    @State private var statutToggle = true
    @State private var TypeAppareil = AppareilCategory.self
    
    var body: some View {
        
        
        ScrollView(.vertical) {
            VStack {
                Text("Type d'appareil")
                    .font(.headline)
                    .bold()
                Picker("Type Appareil", selection: $TypeAppareil)  {
                    ForEach(AppareilCategory.allCases) { Appareils in
                        Text(Appareils.rawValue.capitalized)
                            .tag(Appareils)
                    }
                } // Fin Picker
                    
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
                /* TextField("Description", text: $description)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .foregroundColor(.gray) */
                
                
                
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
                    
                } // Fin Vstack Compétences
                 
            } // Fin Vstack Description
            
        } // Fin ScrollView
        
    } // Fin Body
    
} // Fin Struct

struct CreationAnnonceUtilisateur_Previews: PreviewProvider {
    static var previews: some View {
        CreationAnnonceUtilisateur()
    }
}

