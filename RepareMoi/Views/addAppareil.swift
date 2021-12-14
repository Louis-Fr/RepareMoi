//
//  addAppareil.swift
//  RepareMoi
//
//  Created by Louis REY on 09/12/2021.
//

import SwiftUI

struct addAppareil: View {
    
    @State private var choiceAppareil: AppareilCategory = .ordinateur
    @State private var choiceAppareilMarque: String = ""
    
    @State private var choicePicker: TypeAchat = .neuf
    
    @State private var choiceDateAchat: Int = 1
    @Binding var isOpen: Bool
    @Binding var changeValue: Bool
    
    // OnTapGesture
    @State private var selectionAppareil = false
    @State var sheetOpenAddAppareil: Bool = false
    @State var hasChanged: Bool = false
    
    @ObservedObject var profil: Profil
    
    var marqueToUse: [String] {
        return choiceAppareil == .ordinateur ? AppareilMarque_Ordinateur.cases :
        choiceAppareil == .smartphone ? AppareilMarque_Smartphone.cases :
        choiceAppareil == .tablette ? AppareilMarque_Tablette.cases :
        choiceAppareil == .montreConnecte ? AppareilMarque_Montre.cases : []
    }
    
    var body: some View {
        
                ZStack {
                    Color("BaseColor")
                        .ignoresSafeArea()
                
                    ScrollView {
                        VStack(alignment: .center){
                        
                        Text("Scanner votre appareil")
                            .font(Font.system(size: 18, weight: .bold))
                            
                            .onTapGesture {
                                isOpen = false
                                    
                            }
                            
                          //  Button(action: RecognizerObjectView() {}, label: {
                                Image(systemName: "camera.viewfinder")
                                    .font(.system(size: 40))
                                    //.onTapGesture {
                                        //isOpen = false
                                    //}
                            
                                        .padding(35)
                           // })
                            
                            
                        
                            
                        
                        
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
                        .shadow(radius: 5)
                            
                        Text("Quel est la marque de votre appareil ?")
                            .padding()
                            .font(Font.system(size: 18, weight: .medium))

                        Picker("Type Appareil", selection: $choiceAppareilMarque) {
                            ForEach(marqueToUse, id: \.self) { choixMarqueAppareil in
                                Text(choixMarqueAppareil)
                                    .tag(choixMarqueAppareil)
                            }
                            
                        } // Fin Picker
                        .padding(15)
                        .background(Color.white)
                        .background(.bar)
                        .cornerRadius(50)
                        .shadow(radius: 5)
                        
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
                        .shadow(radius: 5)
                        
                        Text("Quand l'avez-vous acheté ?")
                            .padding()
                            .font(Font.system(size: 18, weight: .medium))
                            
                        
                        Picker("Date achat", selection: $choiceDateAchat) {
                            Text("1 ans").tag(1)
                                Text("2 ans").tag(2)
                                Text("3 ans").tag(3)
                                Text("4 ans").tag(4)
                                Text("5 ans").tag(5)
                                Text("6 ans").tag(6)
                             
                                    //.tag(DateAchat)
                            }
                        .padding(15)
                        .background(Color.white)
                        .background(.bar)
                        .cornerRadius(50)
                        .shadow(radius: 5)
                            
                        }
                        
                        Button(action: {
                            let formatter = DateFormatter()
                            formatter.dateFormat = "YYYY"
                            var anneeAchat = 0
                            if let a = Int(formatter.string(from: Date())) {
                                anneeAchat = a - choiceDateAchat
                            }
                            //print("PROFIL 1 : \(profil.appareils)")
                            profil.appareils.append(Appareil(typeAppareil: choiceAppareil, marqueAppareil: AppareilMarque.getMarqueFrom(string: choiceAppareilMarque), typeAchat: choicePicker, anneeAchat: anneeAchat, modele: "", image: choiceAppareil.rawValue.lowercased() + "_DefaultImage", empreinte: .iphone8Plus))
                            //print("PROFIL 2 : \(profil.appareils)")
                            isOpen = false
                            changeValue.toggle()
                        }) {
                            Text("Ajouter mon appareil")
                                .frame(width: 250, height: 20)
                                .padding(15)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .background(.bar)
                                .cornerRadius(50)
                        }
                        .padding(45)
                    } // Fin Picker
                    
                    
                    // .sheet
                    .onTapGesture {
                        sheetOpenAddAppareil = true
                    }
                    .sheet(isPresented: $sheetOpenAddAppareil, onDismiss: {}, content: {
                        
                        RecognizerObjectView(imagePickerIsPresenting: true, uiImage: nil, sourceType: .photoLibrary, classifier: ImageClassifier())})

                    
                } // Fin Zstack
            
            
                
               
                    
                } // Fin Vstack
           
            
            
        } // Fin View body
        



struct addAppareil_Previews: PreviewProvider {
    static var previews: some View {
        addAppareil(isOpen: .constant(false), changeValue: .constant(false), profil: profilTest)
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
