//
//  addAppareil.swift
//  RepareMoi
//
//  Created by Louis REY on 09/12/2021.
//

import SwiftUI

struct addAppareil: View {
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Quel type d'appareil avez-vous?")
                    .padding()
            }
            
        }
        .navigationTitle("Ajouter un appareil")
    }
}

struct addAppareil_Previews: PreviewProvider {
    static var previews: some View {
        addAppareil()
    }
}
