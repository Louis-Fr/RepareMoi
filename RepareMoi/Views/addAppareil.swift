//
//  addAppareil.swift
//  RepareMoi
//
//  Created by Louis REY on 09/12/2021.
//

import SwiftUI

struct addAppareil: View {
    
    @State private var choiceAppareil: String?
    
    @State private var choicePicker: String?
    
    @State private var choiceDateAchat: String?
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Quel type d'appareil voulez-vous ajouter?")
                    .padding()

                Picker("Type Appareil", selection: $choiceAppareil) {
                    ForEach(AppareilCategory.allCases) { choixTypeAppareil in
                        Text(choixTypeAppareil.rawValue.capitalized)
                            .tag(choixTypeAppareil)
                    }
                } // Fin Picker
                
                Text("Dans quel état était votre appareil lors de l'achat?")
                    .padding()
                
                Picker("Type Appareil", selection: $choicePicker) {
                    ForEach(TypeAchat.allCases) { TypeAchat in
                        Text(TypeAchat.rawValue.capitalized)
                            .tag(TypeAchat)
                    }
                } // Fin Picker
                
                Text("Quand a t'il été acheté?")
                    .padding()
                
                Picker("Date achat", selection: $choiceDateAchat) {
                        Text("1 ans")
                        Text("2 ans")
                        Text("3 ans")
                        Text("4 ans")
                        Text("5 ans")
                        Text("6 ans")
                     
                            //.tag(DateAchat)
                    }
                } // Fin Picker
                
                
            }
            
            .navigationTitle("Ajouter un appareil")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }


struct addAppareil_Previews: PreviewProvider {
    static var previews: some View {
        addAppareil()
    }
}

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
