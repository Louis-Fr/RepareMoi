//
//  CreationAnnonceUtilisateur.swift
//  RepareMoi
//
//  Created by Apprenant 62 on 03/12/2021.
//

import SwiftUI

struct CreationProfil: View {
    
    @State private var name: String = "Nom Prenom"
    //@State private var description: String = "Presentez-vous"
    @State private var profilText: String = "Presentez-vous"
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
                    
                    Image("imagepickerProfil")
                        .scaledToFill()
                        .cornerRadius(25)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .padding()
                }
                
                
                Spacer()
                
                
                VStack {
                    
                    Text("Informations")
                        .font(.headline)
                        .bold()
                    
                    
                    HStack {
                        Image(systemName: "person")
                        TextField("nom prenom", text: $name)
                        
                        //.padding()
                        //.textFieldStyle(.roundedBorder)
                            .foregroundColor(.black)
                            .font(Font.system(size: 15, weight: .medium))
                        
                    }
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    .frame(maxWidth: 300, maxHeight: 15, alignment: .center)
                    .padding()
                    
                    
                    
                    HStack {
                        Image(systemName: "person")
                        TextEditor(text: $profilText)
                        //.padding()
                        //.textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                            .foregroundColor(.black)
                            .font(Font.system(size: 15, weight: .medium))
                            
                        //.lineLimit(6)
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    .frame(width: 300, height: 60)
                    .padding(8)
                    
                    Spacer()
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
        } // Fin ScrollView
    } // Fin Body
    
} // Fin View



struct CreationProfil_Previews: PreviewProvider {
    static var previews: some View {
        CreationProfil()
    }
}



