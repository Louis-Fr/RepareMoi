//
//  MapUser.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 03/12/2021.
//

import SwiftUI
import MapKit

struct MapUser: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region)
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
        MapUser()
    }
}
