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
    
    let filtre: FiltreData?
    
    var profilIsPresented = false
    var filtreIsPresented = false
    var creationUserAnnonceIsPresented = false
    var creationReparateurAnnonceIsPresented = false
    
    var filtreData: FiltreData?
    
    init(profil: Profil) {
        localisation = nil
        region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), span: MKCoordinateSpan(latitudeDelta: 0.75, longitudeDelta: 0.75))
        self.profil = profil
        self.filtre = nil
        self.filtreData = nil
        
        self.annonces = []
        self.annonces = getAnnonces()
    }
    
    init(profil: Profil, filtre: FiltreData) {
        localisation = nil
        region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        self.profil = profil
        self.filtre = filtre
        self.filtreData = nil
        
        self.annonces = []
        self.annonces = getAnnonces()
    }
    
    func mustFilter() -> Bool {
        return filtre != nil
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
    
    fileprivate static func getUserAnnonceImage(annonce: AnnonceUtilisateur) -> String {
        switch (annonce.appareil.typeAppareil) {
            case .ordinateur:
                return "laptopcomputer"
            case .smartphone:
                return "iphone"
            case .tablette:
                return "ipad.landscape"
            default:
                return "applewatch"
        }
    }
}

struct Annotation: Identifiable {
    var id = UUID()
    let coordinate: CLLocationCoordinate2D
    
    let data: AnnonceData
    
    init(annonce: AnnonceUtilisateur, index: Int) {
        self.coordinate = annonce.coordinates
        self.data = AnnonceData(isReparateur: false, index: index, profil: annonce.profil, image: MapUserViewModel.getUserAnnonceImage(annonce:annonce))
    }
    
    init(annonce: AnnonceReparateur, index: Int) {
        self.coordinate = annonce.coordinates
        self.data = AnnonceData(isReparateur: true, index: index, profil: annonce.profil, image: "person.fill")
    }
}

struct AnnonceData: Identifiable {
    let id = UUID()
    let isReparateur: Bool
    let index: Int
    let profil: Profil
    let image: String
}
