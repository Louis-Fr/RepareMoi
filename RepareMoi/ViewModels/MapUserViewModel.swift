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
    
    let profil: Profil
    var annonces: [Annotation]
    
    init(profil: Profil) {
        localisation = nil
        region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        //annonces = [Annotation(coordinate: .init(latitude: 51.507222, longitude: -0.1275), annonce: annoncesUtilisateurs[0])] //TEST
        self.profil = profil
        self.annonces = []
        self.annonces = getAnnonces()
    }
    
    func getAnnonces() -> [Annotation] { //Fonction qui sert a récupérer les annonces, a bosser
        var result: [Annotation] = []
        
        for value in annoncesUtilisateurs {
            if !profil.annoncesReparation.contains(value) { //Coordonnées de tests - a changer
                result.append(Annotation(coordinate: .init(latitude: 51.507222 + Double.random(in: -0.2...0.2), longitude: -0.1275 + Double.random(in: -0.2...0.2)), annonce: value))
            }
        }
        
        for value in annoncesReparateur {
            if value != profil.annonceReparateur { //Coordonnées de tests - a changer
                result.append(Annotation(coordinate: .init(latitude: 51.507222 + Double.random(in: -0.2...0.2), longitude: -0.1275 + Double.random(in: -0.2...0.2)), annonce: value))
            }
        }
        return result
    }
}

struct Annotation: Identifiable {
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
