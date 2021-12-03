//
//  MapUserViewModel.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 03/12/2021.
//

import Foundation
import MapKit

struct MapUserViewModel {
    let localisation: CLLocationCoordinate2D?
    var region: MKCoordinateRegion
    
    let annonces: [Annotation<Any>]
    
    init() {
        localisation = nil
        region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        annonces = [Annotation(coordinate: .init(latitude: 51.507222, longitude: -0.1275), annonce: annoncesUtilisateurs[0])]
    }
}

struct Annotation<T>: Identifiable {
    var id = UUID()
    let coordinate: CLLocationCoordinate2D
    
    let data: AnnonceData
    
    init(coordinate: CLLocationCoordinate2D, annonce: AnnonceUtilisateur) {
        self.coordinate = coordinate
        self.data = AnnonceData(isReparateur: false)
    }
    
    init(coordinate: CLLocationCoordinate2D, annonce: AnnonceReparateur) {
        self.coordinate = coordinate
        self.data = AnnonceData(isReparateur: true)
    }
}

struct AnnonceData {
    let isReparateur: Bool
}
