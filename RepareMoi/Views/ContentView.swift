//
//  ContentView.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 30/11/2021.
//

import SwiftUI

//La ContentView est la vue où l'on place la tabBar
struct ContentView: View {
    
    private var profil = profilTest
    private var appareilTest = profilTest.appareils[0]
    
    var body: some View {
        /*if profil.image != nil {
            profil.image!
                .frame(width: 100, height: 100)
                .cornerRadius(100)
        }
        else {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
        }
        Text("\( profil.nom )")
            .padding()
        Text("\( profil.description )")
            .padding()*/
        
        VStack {
            Text("APPAREIL TEST")
            
            Text("Modèle de l'appareil : \(appareilTest.modele)")
                .padding()
            Text("Appareil de marque :  \(appareilTest.marqueAppareil.marque)")
                .padding()
            Text("Acheté en \(appareilTest.anneeAchat)")
                .padding()
            Text("Empreinte carbone minimale en \(String(format: "%.2f", appareilTest.empreinte.calculerEmpreinteMin()))")
                .padding()
            Text("Empreinte carbone moyenne en \(String(format: "%.2f", appareilTest.calculerEmpreinte()))")
                .padding()
            Text("Empreinte carbone maximale en \(String(format: "%.2f", appareilTest.empreinte.calculerEmpreinteMax(anneeUse: 2021-appareilTest.anneeAchat)))")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
