//
//  MapUser.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 03/12/2021.
//

import SwiftUI
import MapKit

struct MapUser: View {
    @State var viewModel: MapUserViewModel
    @State var showBulles: Bool = false
    @State var test : [Bool]
    
    init(viewModel: MapUserViewModel) {
        self._viewModel = State(initialValue: viewModel)
        self._test = State(initialValue: Array(repeating: false, count: viewModel.annonces.count))
    }
    
    var body: some View {
        ZStack {
//            Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.annonces) { annonce in
            Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.annonces) { annonce in
                MapAnnotation(coordinate: annonce.coordinate, anchorPoint: CGPoint(x: 0.5, y: 1), content: {
                    CustomAnnotation(color: !annonce.data.isReparateur ? .black : .red)
                        .onTapGesture {
                            test[annonce.data.index] = true
                        }
                        .sheet(isPresented: $test[annonce.data.index], onDismiss: {}, content: {
                            // Page description annonce a ouvrir ici
                        })
                    })
            }
                //.ignoresSafeArea()
                //.ignoresSafeArea(.container, edges: .top)
            VStack {
                HStack {
                    Spacer()
                    MapButton(image: "slider.horizontal.3")
                        .padding()
                        .foregroundColor(.blue)
                        .onTapGesture {
                            viewModel.filtreIsPresented = true
                        }
                        .sheet(isPresented: $viewModel.filtreIsPresented, onDismiss: {}, content: {
                            FiltreMap(isPresented: $viewModel.filtreIsPresented, filterData: $viewModel.filtreData, viewModel: FiltreMapViewModel())
                        })
                }
                Spacer()
                HStack {
                    Button(action: {}) {
                        Text("Réparer un appareil")
                            .foregroundColor(.white)
                            //.padding(.horizontal)
                            .padding(.vertical, 7)
                            .lineLimit(1)
                            .font(.system(size:14))
                            .frame(width:showBulles ? 185 : 0)
                    }
                        .background(Color.blue)
                        .cornerRadius(25)
                        //.frame(width: showBulles ? 185 : 0)
                        .animation(.easeInOut(duration: 0.25), value: showBulles)
//                    Spacer()
//                        .frame(minWidth: 20, maxWidth: 30)
                    Button(action: {}) {
                        Text("Faire réparer mon appareil")
                            .foregroundColor(.white)
                            //.padding(.horizontal)
                            .padding(.vertical, 7)
                            .lineLimit(1)
                            .font(.system(size:14))
                            .frame(width:showBulles ? 185 : 0)
                    }
                        .background(Color.black)
                        .cornerRadius(25)
                        //.frame(width: showBulles ? 185 : 0)
//                        .opacity(showBulles ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 0.25), value: showBulles)
                }
                
                MapButton(image: "plus")
                    .padding(.bottom)
                    .onTapGesture {
                        showBulles.toggle()
                    }
                    .foregroundColor(.blue)
            }
        }
    }
}

struct MapUser_Previews: PreviewProvider {
    static var previews: some View {
        MapUser(viewModel: MapUserViewModel(profil: profilTest))
    }
}
