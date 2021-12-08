//
//  CreationAnnonceUtilisateur.swift
//  RepareMoi
//
//  Created by Apprenant 62 on 03/12/2021.
//

import SwiftUI

enum niveaudecopetence:Int{
    case niveau1 = 1
    case niveau2 = 2
    case niveau3 = 3
    case niveau4 = 4
    case niveau5 = 5
}

struct SelectionNivCompetence: View{
    @Binding public var niveauDeCompetence:Int
    @Binding var isopened:Bool
    var texttitle:String = ""
    
    var body: some View{
        VStack{
            Text(texttitle)
            VStack{
                Picker("", selection: $niveauDeCompetence, content: {
                    Text("1").tag(niveaudecopetence.niveau1)
                    Text("2").tag(niveaudecopetence.niveau2)
                    Text("3").tag(niveaudecopetence.niveau3)
                    Text("4").tag(niveaudecopetence.niveau4)
                    Text("5").tag(niveaudecopetence.niveau5)
                }).pickerStyle(.inline)
                Button(action: {
                    isopened.toggle()
                }, label: {
                    Text("Terminé")
                })
            }
        }
    }
}


struct CreationProfil: View {
    
    @State public var ChoieDuNiveauSheet = false
    
    // IMAGEPICKER
    
    @State private var showPhotoPicker = false
    @State private var avatarImage = UIImage(named: "imagepickerProfil")!
    
    // INFORMATIONS
    @State private var name: String = "Nom Prenom"
    @State private var profilText: String = "Presentez-vous"
    
    //TOGGLE
    @State private var statutToggleOrdinateur = false
    @State private var statutToggleSmartphone = false
    @State private var statutToggleTablette = false
    @State private var statutToggleAucune = false
    
    //NIVEAU DE COMPETENCE
    
    @State private var niveauOrdinateur:Int = 1
    @State private var niveauSmartphone:Int = 1
    @State private var niveauTablette:Int = 1
    
    // PICKER
    @State private var city = ["Londres", "Nancy", "Lille"]
    @State private var selectedPickerCity = "Paris"
    
    // BOUTON RETOUR CUSTOM, Audrey
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image(systemName: "arrow.left") 
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color("GrayCustom"))
            Text("Retour")
                .foregroundColor(Color("GrayCustom"))
                .font(.system(size: 20))
        }
    }
    }
    
    
    
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack { // IMAGEPICKER
                    Image(uiImage: avatarImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .onTapGesture { showPhotoPicker = true }
                    
                }
                .sheet(isPresented: $showPhotoPicker, content: {
                    photoPicker(avatarImage: $avatarImage)
                })
                
                
                Spacer()
                
                
                VStack {
                    
                    Text("Informations")
                        .font(.headline)
                        .bold()
                    
                    
                    HStack {
                        Image(systemName: "person")
                        TextField("nom prenom", text: $name)
                            .foregroundColor(.black)
                            .font(Font.system(size: 15, weight: .medium))
                        
                    } // Fin Hstack
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    .frame(maxWidth: 300, maxHeight: 15, alignment: .center)
                    .padding()
                    
                    
                    
                    HStack {
                        Image(systemName: "person")
                        TextEditor(text: $profilText)
                            .lineLimit(2)
                            .padding(.trailing)
                            .foregroundColor(.black)
                            .font(Font.system(size: 15, weight: .medium))
                        // Trouver comment limiter le nombre de ligne - .lineLimit ne marche pas
                        
                        
                    }
                    .padding(12)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    .frame(width: 300, height: 60)
                    .padding(8)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    VStack {
                        Text("Compétences en réparation")
                            .font(.headline)
                            .bold()
//
//                        Text("selectioner vos compentences")
                        if (!statutToggleAucune){
                            
                            //si l'utilisateur active le toggle aucun, alors statutToggleAucune (state qui rafraichie la page) n'afficheras pas les toggle
                        Toggle("Ordinateur", isOn: $statutToggleOrdinateur)
                            .padding()
                            .toggleStyle(SwitchToggleStyle(tint: .blue))
                            .sheet(isPresented: $ChoieDuNiveauSheet, content: {
                                SelectionNivCompetence(niveauDeCompetence: $niveauOrdinateur, isopened: $ChoieDuNiveauSheet, texttitle: "selectioner votre niveau de competence")
                            })
                            .onTapGesture {
                                if (!statutToggleOrdinateur){
                                    ChoieDuNiveauSheet.toggle()
                                }
                                
                            }
                            Toggle("Smartphone", isOn: $statutToggleSmartphone)
                                .padding()
                                .toggleStyle(SwitchToggleStyle(tint: .blue))
                                .sheet(isPresented: $ChoieDuNiveauSheet, content: {
                                    SelectionNivCompetence(niveauDeCompetence: $niveauSmartphone, isopened: $ChoieDuNiveauSheet, texttitle: "selectioner votre niveau de competence")
                                })
                                .onTapGesture {
                                    if (!statutToggleSmartphone){
                                        ChoieDuNiveauSheet.toggle()
                                    }
                                    
                                }
                            
                            Toggle("Tablette", isOn: $statutToggleTablette)
                                .padding()
                                .toggleStyle(SwitchToggleStyle(tint: .blue))
                                .sheet(isPresented: $ChoieDuNiveauSheet, content: {
                                    SelectionNivCompetence(niveauDeCompetence: $niveauTablette, isopened: $ChoieDuNiveauSheet, texttitle: "selectioner votre niveau de competence")
                                })
                                .onTapGesture {
                                    if (!statutToggleTablette){
                                        ChoieDuNiveauSheet.toggle()
                                    }
                                    
                                }
                        }
                        Toggle("Aucune", isOn: $statutToggleAucune)
                            .toggleStyle(SwitchToggleStyle(tint: .blue))
                            .padding()
                            .onTapGesture {
                                niveauTablette = 0
                                niveauOrdinateur = 0
                                niveauSmartphone = 0
                                statutToggleTablette = false
                                statutToggleSmartphone = false
                                statutToggleOrdinateur = false
                            }
                            
                            
                        
                        
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
                            .padding(15)
                            .background(Color("BaseColor"))
                            .background(.bar)
                            .cornerRadius(50)
                        // Styler le Picker
                        
                        
                        
                    } // Fin Vtsack Compétences
                } // Fin Vstack Informations
                
                .padding()
                
                NavigationLink(destination: Text("Votre compte est bien créer")) {
                    Text("Créer mon compte")
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                .navigationBarTitle("Création Profil", displayMode: .inline)
                
            } // Fin Navigation View
            
            
        }.navigationBarBackButtonHidden(true)
        
            .navigationBarItems(leading: btnBack)
            
            // Fin ScrollView, Cacher le bouton retour original par le custom, Audrey
        
    } // Fin Body
    
} // Fin View



struct CreationProfil_Previews: PreviewProvider {
    static var previews: some View {
        CreationProfil()
    }
}



