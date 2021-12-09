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
            
            VStack {
                Toggle("Êtes-vous un réparateur ?", isOn: $viewModel.isReparateur)
                    
                .padding(.horizontal)
                //.padding(.top)
                //.padding()
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
           
                
            
            Text(firstPickerText)
                .bold()
                .font(.title2)
                .padding()
            Picker(firstPickerText, selection: $viewModel.selectedAppareilType) {
                ForEach(AppareilCategory.allCases) { item in
                    Text(item.rawValue)
                }
            }
                .pickerStyle(.menu)
                .font(.largeTitle)
                .padding(.all)
            
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
//                ForEach(viewModel.localisationsList) {
//
//                }
            }
        }
    }
}

struct FiltreMap_Previews: PreviewProvider {
    static var previews: some View {
        FiltreMap(isPresented: .constant(false), filterData: .constant(FiltreData(isReparateur: false, appareilType: .ordinateur)), viewModel: FiltreMapViewModel())
    }
}
