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
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.annonces) { annonce in
                MapAnnotation(coordinate: annonce.coordinate, anchorPoint: CGPoint(x: 0.5, y: 1), content: {
                    CustomAnnotation(color: annonce.data.isReparateur ? .black : .red)
                    })
            }
                //.ignoresSafeArea()
                //.ignoresSafeArea(.container, edges: .top)
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: {
                        //INSERER LA VUE DE DESTINATION
                    }) {
                        MapButton(image: "slider.horizontal.3")
                            .padding()
                    }
                        .foregroundColor(.black)
                }
                Spacer()
                NavigationLink(destination: {
                    //INSERER LA VUE DE DESTINATION
                }) {
                MapButton(image: "plus")
                    .padding()
                }
                    .foregroundColor(.black)
            }
        }
    }
}

struct MapUser_Previews: PreviewProvider {
    static var previews: some View {
        MapUser(viewModel: MapUserViewModel())
    }
}
