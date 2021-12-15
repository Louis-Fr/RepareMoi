//
//  infoProfil.swift
//  RepareMoi
//
//  Created by Apprenant 62 on 15/12/2021.
//

import SwiftUI

struct infoProfil: View {
    
    var myProfil : Profil
    
    @State var wantedLocalization = ""
    
    @State var activeToggleOrdinateur = true
    @State var activeToggleSmartphone = true
    @State var activeToggleTablette = true
    @State var activeToggleAutre = true
    
    var body: some View {
        VStack {
            
            if myProfil.image != nil {
                myProfil.image!
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 180, height: 180)
                    
            } else {
                Circle()
                    .frame(width: 180, height: 180)
                    .foregroundColor(.gray)
                
            }
            
            
            Text(myProfil.nom)
                .padding()
            Text("Description")
                .font(.title2)
                .bold()
            
            Text(myProfil.description)
                .padding()
                .padding(.horizontal, 50)
                .background(Color("BaseColor"))
                .cornerRadius(15)
                .frame(alignment: .leading)
            
            Text("Localisation")
                .font(.title2)
                .bold()
                .padding()
                
            Picker("Localisation", selection: $wantedLocalization) {
                Text("Aucune Localisation").tag("")
                ForEach(GeoFinder.departments) { dep in
                    Text("\(dep.depName) (\(dep.id))")
                }
                

            }
            
            .padding()
                
            Spacer()
            
            Toggle("Ordinateur", isOn: $activeToggleOrdinateur)
                .padding()
            Toggle("Smartphone", isOn: $activeToggleSmartphone)
                .padding()
            Toggle("Tablette", isOn: $activeToggleTablette)
                .padding()
            Toggle("Aucune", isOn: $activeToggleAutre)
                .padding()
            
            
            
        }
    }
    
    
    struct infoProfil_Previews: PreviewProvider {
        static var previews: some View {
            infoProfil(myProfil: profilTest)
        }
    }
}
