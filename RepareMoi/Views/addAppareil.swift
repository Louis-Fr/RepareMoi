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
    
                ZStack {
                    Color("BaseColor")
                        .ignoresSafeArea()
                
                    VStack(alignment: .center){
                    
                    Text("Scanner votre appareil")
                        .padding()
                        .font(Font.system(size: 18, weight: .bold))
                    NavigationLink(destination: AppareilUser(),
                                   label: {
                        Image(systemName: "camera.viewfinder")
                            .font(.system(size: 40))
                    })
                            .padding(35)
                    
                        
                    
                    
                    Text("Quel type d'appareil voulez-vous ajouter ?")
                        .padding()
                        .font(Font.system(size: 18, weight: .medium))

                    Picker("Type Appareil", selection: $choiceAppareil) {
                        ForEach(AppareilCategory.allCases) { choixTypeAppareil in
                            Text(choixTypeAppareil.rawValue.capitalized)
                                .tag(choixTypeAppareil)
                        }
                       
                    } // Fin Picker
                    .padding(15)
                    .background(Color.white)
                    .background(.bar)
                    .cornerRadius(50)
                    
                    Text("Dans quel état était votre appareil lors de l'achat ?")
                        .padding()
                        .font(Font.system(size: 18, weight: .medium))
                    
                    Picker("Type Appareil", selection: $choicePicker) {
                        ForEach(TypeAchat.allCases) { TypeAchat in
                            Text(TypeAchat.rawValue.capitalized)
                                .tag(TypeAchat)
                        }
                       
                    } // Fin Picker
                    .padding(15)
                    .background(Color.white)
                    .background(.bar)
                    .cornerRadius(50)
                    
                    Text("Quand l'avez-vous acheté ?")
                        .padding()
                        .font(Font.system(size: 18, weight: .medium))
                        
                    
                    Picker("Date achat", selection: $choiceDateAchat) {
                            Text("1 ans")
                            Text("2 ans")
                            Text("3 ans")
                            Text("4 ans")
                            Text("5 ans")
                            Text("6 ans")
                         
                                //.tag(DateAchat)
                        }
                    .padding(15)
                    .background(Color.white)
                    .background(.bar)
                    .cornerRadius(50)
                        
                        Button(action: {
                            print("Appareil ajouté")
                        }) {
                            Text("Ajouter mon appareil")
                                .padding(15)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .background(.bar)
                                .cornerRadius(50)
                        }
                        .padding(45)
                        
                    } // Fin Picker
                    
                } // Fin Zstack
               
                    
                } // Fin Vstack
           
            
           
            
            
            
            } // Fin NavigationView
            
        } // Fin View body
        



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
