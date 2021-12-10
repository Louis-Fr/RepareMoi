//
//  AnnonceReparateurView.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 06/12/2021.
//

import SwiftUI

struct AnnonceReparateurView: View {
    let profil: Profil
    
    var body: some View {
        ZStack {
            Color.init(red:136/255.0,green:186/255.0,blue:232/255.0)
            VStack {
                Spacer()
                HStack {
                    if let img = profil.image {
                        img
                            .resizable()
                            .frame(width: 90, height: 90)
                            .cornerRadius(100)
                    } else {
                        ZStack {
                            Circle()
                                .frame(width: 90, height: 90)
                            .foregroundColor(Color.init(white: 0.92))
                            Image(systemName: "person")
                                .foregroundColor(Color.init(white: 0.5))
                                .font(.largeTitle)
                        }
                    }
                    Text("Annonce Reparateur")
                        .bold()
                        .font(.title2)
                }
                Spacer()
                HStack {
                    Spacer()
                    HStack {
                        Circle()
                            .frame(width: 15, height: 15)
                            .foregroundColor(profil.isReparateur ? Color.init(red: 38/255.0, green: 153/255.0, blue: 38/255.0) : Color.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0))
                        Text(profil.isReparateur ? "Active" : "Inactive")
                            .bold()
                    }
                    .padding(Edge.Set.top, -28)
                    .padding(.horizontal)
                }
            }
        }
        .cornerRadius(20)
        .padding()
        .frame(height: 150)
        .foregroundColor(.white)
    }
}

struct AnnonceReparateurView_Previews: PreviewProvider {
    static var previews: some View {
        AnnonceReparateurView(profil: profilTest)
    }
}
