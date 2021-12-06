//
//  AppareilListView.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 06/12/2021.
//

import SwiftUI

struct AppareilListView: View {
    let annonce: AnnonceUtilisateur
    let bgColor: Color
    
    var body: some View {
        ZStack {
            HStack {
                if let img = annonce.image {
                    img
                        .resizable()
                } else {
                    Image("\(annonce.appareil.typeAppareil.id)_DefaultImage")
                }
                VStack(alignment:.leading) {
                    Text(annonce.title)
                        .bold()
                        .font(.title)
                    Text(annonce.appareil.marqueAppareil.marque)
                        .font(.title3)
                        .foregroundColor(Color.init(white:0.25))
                }
            }
            .padding()
        }
            .padding()
            .background(bgColor)
            .cornerRadius(100)
    }
}

struct AppareilListView_Previews: PreviewProvider {
    static var previews: some View {
        AppareilListView(annonce: annoncesUtilisateurs[0], bgColor: .green)
    }
}
