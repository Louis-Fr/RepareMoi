//
//  AnnonceUser.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 03/12/2021.
//

import SwiftUI

struct AnnonceUser: View {
    let profil: Profil
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    AnnonceReparateurView(profil: profil)
                    ForEach(profil.annoncesReparation) { a in
                        AppareilListView(annonce: a, bgColor: Color.init(red:221/255.0,green:240/255.0,blue:242/255.0))
                    }
                    Spacer()
                }
                .navigationBarTitle("Mes Annonces")
            }
        }
    }
}

struct AnnonceUser_Previews: PreviewProvider {
    static var previews: some View {
        AnnonceUser(profil: profilTest)
.previewInterfaceOrientation(.portrait)
    }
}       
