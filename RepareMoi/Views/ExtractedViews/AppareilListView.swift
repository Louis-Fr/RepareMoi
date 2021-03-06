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
                Spacer()
                if let img = annonce.image {
                    img
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .cornerRadius(20)
                } else {
                    Image("\(annonce.appareil.typeAppareil.id.lowercased())_DefaultImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                }
                Spacer()
                VStack(alignment:.leading) {
                    Text(annonce.title)
                        .bold()
                        .font(.title2)
                    Text(annonce.appareil.marqueAppareil.marque)
                        .font(.title3)
                        .foregroundColor(Color.init(white:0.25))
                }
                Spacer()
            }
            .padding()
            .frame(height: 145)
        }
            .padding(.trailing)
            .background(bgColor)
            .cornerRadius(20)
    }
}

struct AppareilListView_Previews: PreviewProvider {
    static var previews: some View {
        AppareilListView(annonce: annoncesUtilisateurs[0], bgColor: .green)
    }
}
