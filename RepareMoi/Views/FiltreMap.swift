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
        
        ZStack {
            Color("BaseColor")
                .ignoresSafeArea()
            
                VStack {
                Toggle("Êtes-vous un réparateur ?", isOn: $viewModel.isReparateur)
                    
                .padding(.horizontal)
                //.padding(.top)
                //.padding()
                .padding()
                
            
            Text(firstPickerText)
                .font(Font.system(size: 18, weight: .medium))
                .padding()
                    
            Picker(firstPickerText, selection: $viewModel.selectedAppareilType) {
                ForEach(AppareilCategory.allCases) { item in
                    Text(item.rawValue)
                    
                }
                
            } // Fin Picker
                //.pickerStyle(.menu)
                //.font(.largeTitle)
                //.padding(.all)
                    
                .padding(15)
                .background(Color.white)
                .background(.bar)
                .cornerRadius(50)
                .shadow(radius: 5)
                .padding()
                    
            
            if !viewModel.isReparateur {
                
                Text("Avez-vous les pièces de réparations?")
                    .font(Font.system(size: 18, weight: .medium))
                    .padding()
                Picker("Avez-vous les pièces de réparations?", selection: $viewModel.userHasPieces) {
                    Text("Oui").tag(true)
                    Text("Non").tag(false)
                    
                }
                    .pickerStyle(.segmented)
                    //.font(.system(size: 10))
                    .padding()
                
            }
            
            Text("Localisation")
                .font(Font.system(size: 18, weight: .medium))
                .bold()
                .font(.title2)
                .padding()
                
            Picker("Localisation", selection: $viewModel.wantedLocalization) {
                Text("Aucune Localisation").tag("")
                ForEach(GeoFinder.departments) { dep in
                    Text("\(dep.depName) (\(dep.id))")
                }

            }
            .padding(15)
            .background(Color.white)
            .background(.bar)
            .cornerRadius(50)
                    
            
            .padding()
            .shadow(radius: 5)
        
                    
                
            Button(action: {
                isPresented = false
            }) {
                Text("Filtrer les résultats")
                    /* .frame(width: 250, height: 20)
                    .bold()
                    .font(.headline)
                    .padding(10)
                    .padding(.horizontal)
                    .background(Color.blue)
                    .cornerRadius(50)
                    .foregroundColor(.white) */
                
                    .frame(width: 250, height: 20)
                    .padding(15)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .background(.bar)
                    .cornerRadius(50)
                
                
                
            } // Fin Button
            .padding(.top, 75)
                } // Fin Vstack
        } // Fin Zstack
            
        
    }
}

struct FiltreMap_Previews: PreviewProvider {
    static var previews: some View {
        FiltreMap(isPresented: .constant(false), filterData: .constant(FiltreData(isReparateur: false, appareilType: .ordinateur)), viewModel: FiltreMapViewModel())
    }
}
