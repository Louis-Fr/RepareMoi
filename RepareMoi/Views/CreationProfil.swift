//
//  CreationAnnonceUtilisateur.swift
//  RepareMoi
//
//  Created by Apprenant 62 on 03/12/2021.
//

import SwiftUI

struct CreationProfil: View {
    
        struct Profil {
            let nom: String
            let description: String
            let disponibilite: Disponibilite
            let appareils: [Appareil]
            let annoncesReparation: [AnnonceUtilisateur]
            let annonceReparateur: AnnonceReparateur
            let image: Image?
            //Les compétences du profil si il à été déclaré en mode réparateur au moins une fois
            var competence: [CompetenceAppareil:Int] = [:]
    
            var isReparateur: Bool {
                return annonceReparateur == AnnonceReparateur.vide
            }
    
            //Fonction pour sauvegarder le profil dans les préférences utilisateur - A FAIRE
            func saveToUserDefaults() {
    
            }
    
            //Fonction pour charger le profil depuis les préférences utilisateur - A FAIRE
            func loadFromUserDefaults() {
    
            }
        }
    
    
    
    
    
    @State private var name: String = "Nom Prenom"
    @State private var description: String = "Presentez-vous"
    @State private var statutToggleOrdinateur = false
    @State private var statutToggleSmartphone = false
    @State private var statutToggleTablette = false
    @State private var statutToggleAutre = false
    
    var body: some View {
        
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
//                .keyboardType(.default)
            

            
            
            
            
            
            
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
                
            } // Fin Vstack 3
            
            // Fin Vstack 2
        } // Fin Vstack 1
        
    }
    }
    
    struct CreationProfil_Previews: PreviewProvider {
        static var previews: some View {
            CreationProfil()
        }
    }
    
    

