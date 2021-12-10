//
//  FiltreUtilisateur.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 08/12/2021.
//

import SwiftUI

struct FiltreMap: View {
    @Binding var isPresented: Bool
    @Binding var filterData : FiltreData?
    
    @State var viewModel: FiltreMapViewModel
    
    var firstPickerText : String {
        return viewModel.isReparateur ? "Quel type d'appareil souhaitez-vous réparer?" : "Quel type d'appareil avez-vous?"
    }
    
    var body: some View {
        VStack {
            Toggle("Êtes-vous un réparateur ?", isOn: $viewModel.isReparateur)
                .padding(.horizontal)
            
            Text(firstPickerText)
                .bold()
                .font(.title2)
            Picker(firstPickerText, selection: $viewModel.selectedAppareilType) {
                ForEach(AppareilCategory.allCases) { item in
                    Text(item.rawValue)
                }
            }
                .pickerStyle(.menu)
                .font(.largeTitle)
            
            if !viewModel.isReparateur {
                
                Text("Avez-vous les pièces de réparations?")
                    .bold()
                    .font(.title2)
                Picker("Avez-vous les pièces de réparations?", selection: $viewModel.userHasPieces) {
                    Text("Oui").tag(true)
                    Text("Non").tag(false)
                }
                    .pickerStyle(.segmented)
            }
            
            Text("Localisation")
                .bold()
                .font(.title2)
            Picker("Localisation", selection: $viewModel.wantedLocalization) {
                Text("Aucune Localisation").tag("")
                ForEach(GeoFinder.countries, id: \.self) { country in
                    Text(country)
                }
            }
            Spacer()
                .frame(height: 100)
            Button(action: {
                isPresented = false
            }) {
                Text("Filtrer les résultats")
                    .bold()
                    .font(.title2)
                    .padding(10)
                    .padding(.horizontal, 50)
                    .background(Color.gray)
                    .cornerRadius(50)
                    .foregroundColor(.white)
            }
        }
    }
}

struct FiltreMap_Previews: PreviewProvider {
    static var previews: some View {
        FiltreMap(isPresented: .constant(false), filterData: .constant(FiltreData(isReparateur: false, appareilType: .ordinateur)), viewModel: FiltreMapViewModel())
    }
}
