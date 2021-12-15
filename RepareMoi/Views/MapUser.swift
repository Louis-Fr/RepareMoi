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
    
    @State var creationAnnonceUser: Bool = false
    @State var creationAnnonceRepa: Bool = false
    
    static let bullesSize: CGFloat = 240
    
    init(viewModel: MapUserViewModel) {
        self._viewModel = State(initialValue: viewModel)
        self._test = State(initialValue: Array(repeating: false, count: viewModel.annonces.count))
    }
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.annonces) { annonce in
                MapAnnotation(coordinate: annonce.coordinate, anchorPoint: CGPoint(x: 0.5, y: 1), content: {
                    CustomAnnotation(color: !annonce.data.isReparateur ? .black : .blue, image: annonce.data.image)
                        .onTapGesture {
                            test[annonce.data.index] = true
                        }
                        .sheet(isPresented: $test[annonce.data.index], onDismiss: {}, content: {
                            if annonce.data.isReparateur {
                                ProfilView()
                            } else {
                                DetailAnnonce()
                            }
                        })
                    })
            }
            VStack {
                HStack {
                    MapButton(image: "person.fill")
                        .padding()
                        .padding(.top)
                        .padding(.top, 5)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            viewModel.filtreIsPresented = true
                        }
                        .sheet(isPresented: $viewModel.filtreIsPresented, onDismiss: {}, content: {
                            infoProfil(myProfil: viewModel.profil)
                        })
                    Spacer()
                    MapButton(image: "slider.horizontal.3")
                        .padding()
                        .padding(.top)
                        .padding(.top, 5)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            viewModel.filtreIsPresented = true
                        }
                        .sheet(isPresented: $viewModel.filtreIsPresented, onDismiss: {}, content: {
                            FiltreMap(isPresented: $viewModel.filtreIsPresented, filterData: $viewModel.filtreData, viewModel: FiltreMapViewModel())
                        })
                }
                Spacer()
                VStack {
                    Button(action: {
                        self.creationAnnonceRepa = true
                    }) {
                        Text("Réparer un appareil")
                            .foregroundColor(.white)
                            .padding(.vertical, 7)
                            .lineLimit(1)
                            .font(.system(size:18))
                            //.frame(width:showBulles ? MapUser.bullesSize : 0)
                            .frame(width: MapUser.bullesSize)
                    }
                        .background(Color.blue)
                        .cornerRadius(25)
                        //.animation(.easeInOut(duration: 0.25), value: showBulles)
                        .sheet(isPresented: $creationAnnonceRepa, onDismiss: {}, content: {
                            CreationAnnonceReparateur(profil: profilTest)
                        })
                        .shadow(color: .black, radius: 4, x: 2, y: 2)
                    Button(action: {
                        self.creationAnnonceUser = true
                    }) {
                        Text("Faire réparer mon appareil")
                            .foregroundColor(.white)
                            .padding(.vertical, 7)
                            .lineLimit(1)
                            .font(.system(size:18))
                            .frame(width: MapUser.bullesSize)
                    }
                        .background(Color.black)
                        .cornerRadius(25)
                        .sheet(isPresented: $creationAnnonceUser, onDismiss: {}, content: {
                            CreationAnnonceUtilisateur(profil: profilTest)
                        })
                        .shadow(color: .black, radius: 4, x: 2, y: 2)
                }
                .frame(maxHeight: showBulles ? 106 : 0)
                .clipped()
                .animation(.easeInOut(duration: 0.25), value: showBulles)
                
                MapButton(image: showBulles ? "minus" : "plus")
                    .padding(.bottom)
                    .onTapGesture {
                        showBulles.toggle()
                    }
                    .foregroundColor(.blue)
            }
        }
//            .ignoresSafeArea()
            .ignoresSafeArea(.container, edges: .top)
    }
}

struct MapUser_Previews: PreviewProvider {
    static var previews: some View {
        MapUser(viewModel: MapUserViewModel(profil: profilTest))
    }
}
