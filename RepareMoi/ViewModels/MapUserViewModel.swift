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
        self.profil = profil
        self.annonces = []
        self.annonces = getAnnonces()
    }
    
    func getAnnonces() -> [Annotation] { //Fonction qui sert a récupérer les annonces, a bosser
        var result: [Annotation] = []
        
        for value in annoncesUtilisateurs {
            if !profil.annoncesReparation.contains(value) { //Coordonnées de tests - a changer
                result.append(Annotation(annonce: value, index: result.count))
            }
        }
        
        for value in annoncesReparateur {
            if value != profil.annonceReparateur { //Coordonnées de tests - a changer
                result.append(Annotation(annonce: value, index: result.count))
            }
        }
        return result
    }
}

struct Annotation: Identifiable {
    var id = UUID()
    let coordinate: CLLocationCoordinate2D
    
    let data: AnnonceData
    
    init(annonce: AnnonceUtilisateur, index: Int) {
        self.coordinate = annonce.coordinates
        self.data = AnnonceData(isReparateur: false, index: index)
    }
    
    init(annonce: AnnonceReparateur, index: Int) {
        self.coordinate = annonce.coordinates
        self.data = AnnonceData(isReparateur: true, index: index)
    }
}

struct AnnonceData: Identifiable {
    let id = UUID()
    let isReparateur: Bool
    let index: Int
}
