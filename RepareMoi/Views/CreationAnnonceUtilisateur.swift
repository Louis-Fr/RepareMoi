//
//  CreationAnnonceUtilisateur.swift
//  RepareMoi
//
//  Created by Apprenant 62 on 03/12/2021.
//

import SwiftUI

struct CreationAnnonceUtilisateur: View {
    
    
    @State private var descriptionProbleme: String = "Description du problème"
    @State private var statutToggleSemaine = false
    @State private var statutToggleWeekend = false
    @State private var statutToggleUrgent = false
    @State private var typeAppareil = false
    
    var body: some View {
        
        
        ScrollView(.vertical) {
            VStack {
                Text("Type d'appareil")
                    .font(.headline)
                    .bold()
                Picker("Type Appareil", selection: $typeAppareil)  {
                    ForEach(AppareilCategory.allCases) { Appareils in
                        Text(Appareils.rawValue.capitalized)
                            .tag(Appareils)
                            
                            
                    }
                    /*
                    .background(.bar)
                     */

                } // Fin Picker
                .padding(15)
                .background(.bar)
                .cornerRadius(15)
                
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
            
            
                 
            
            
        } // Fin ScrollView
        
    } // Fin Body
    
} // Fin Struct

struct CreationAnnonceUtilisateur_Previews: PreviewProvider {
    static var previews: some View {
        CreationAnnonceUtilisateur()
    }
}

