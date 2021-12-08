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
enum TypeAppareil:String{
    case ordi = "Ordinateur | niveau : "
    case phon = "Smartphone | niveau : "
    case tab = "Tablette | niveau : "
}

struct SelectionNivCompetence: View{
    var typedelapareil:TypeAppareil
    
    @Binding var istoggled:Bool
    @Binding var Texttoggle:String
    @Binding var niveauDeCompetence:Int
    @Binding var isopened:Bool
    var texttitle:String = ""
    
    var body: some View{
        VStack{
            Text(texttitle)
            VStack{
                Picker("", selection: $niveauDeCompetence, content: {
                    Text("1").tag(niveaudecopetence.niveau1.rawValue)
                    Text("2").tag(niveaudecopetence.niveau2.rawValue)
                    Text("3").tag(niveaudecopetence.niveau3.rawValue)
                    Text("4").tag(niveaudecopetence.niveau4.rawValue)
                    Text("5").tag(niveaudecopetence.niveau5.rawValue)
                }).pickerStyle(.inline)
                Button(action: {
//                    niveauDeCompetence = 0
                    Texttoggle = "\(typedelapareil.rawValue) \(niveauDeCompetence)"
                    isopened.toggle()
                }, label: {
                    Text("Terminé")
                })
            }.onDisappear(perform: {
                if (niveauDeCompetence == 0){
                    istoggled = false
                }
            })
        }
    }
}


struct CreationProfil: View {
    
    @State private var TextToggleOrinateur = "Ordinateur | niveau : "
    @State private var TextToggleSmartphone = "Smartphone | niveau : "
    @State private var TextToggleTablette = "Tablette | niveau : "
    
    
    @State public var ChoieDuNiveauSheetPc = false
    @State public var ChoieDuNiveauSheetPhone = false
    @State public var ChoieDuNiveauSheetTab = false
    
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
    
    @State private var niveauOrdinateur:Int = 0
    @State private var niveauSmartphone:Int = 0
    @State private var niveauTablette:Int = 0
    
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
                            
                                Toggle(statutToggleOrdinateur ? TextToggleOrinateur : "Ordinateur", isOn: $statutToggleOrdinateur)
                                .padding()
                                .toggleStyle(SwitchToggleStyle(tint: .blue))
                                .sheet(isPresented: $ChoieDuNiveauSheetPc, content: {
                                    SelectionNivCompetence(typedelapareil: .ordi, istoggled: $statutToggleOrdinateur, Texttoggle: $TextToggleOrinateur, niveauDeCompetence: $niveauOrdinateur, isopened: $ChoieDuNiveauSheetPc, texttitle: "selectioner votre niveau de competence")
                                })
                                
                                .onTapGesture {
                                    if (!statutToggleOrdinateur){
                                        ChoieDuNiveauSheetPc.toggle()
                                    }
                                    
                                }
                                
                            
                            
                                Toggle(statutToggleSmartphone ? TextToggleSmartphone : "Smartphone", isOn: $statutToggleSmartphone)
                                    .padding()
                                    .toggleStyle(SwitchToggleStyle(tint: .blue))
                                    .sheet(isPresented: $ChoieDuNiveauSheetPhone, content: {
                                        SelectionNivCompetence(typedelapareil: .phon, istoggled: $statutToggleSmartphone, Texttoggle: $TextToggleSmartphone, niveauDeCompetence: $niveauSmartphone, isopened: $ChoieDuNiveauSheetPhone, texttitle: "selectioner votre niveau de competence")
                                    })
                                    .onTapGesture {
                                        if (!statutToggleSmartphone){
                                            ChoieDuNiveauSheetPhone.toggle()
                                        }
                                        
                                    }
                            
                            Toggle(statutToggleTablette ? TextToggleTablette : "Tablette", isOn: $statutToggleTablette)
                                .padding()
                                .toggleStyle(SwitchToggleStyle(tint: .blue))
                                .sheet(isPresented: $ChoieDuNiveauSheetTab, content: {
                                    SelectionNivCompetence(typedelapareil: .tab, istoggled: $statutToggleTablette, Texttoggle: $TextToggleTablette, niveauDeCompetence: $niveauTablette, isopened: $ChoieDuNiveauSheetTab, texttitle: "selectioner votre niveau de competence")
                                })
                                .onTapGesture {
                                    if (!statutToggleTablette){
                                        ChoieDuNiveauSheetTab.toggle()
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
                            Text("Marseille")
                            Text("Paris")
                            Text("Lyon")
                            Text("Lille")
                            Text("Toulouse")
                            Text("Bordeaux")
                            Text("Nice")
                            Text("Nantes")
                            Text("Strasbourg")
                            
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



