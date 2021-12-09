//
//  AnnonceRéparateur.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 02/12/2021.
//

import Foundation

import SwiftUI
import CoreLocation

class AnnonceReparateur : Equatable, Identifiable {
    static func == (lhs: AnnonceReparateur, rhs: AnnonceReparateur) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    let dateLimite: Date
    let profil: Profil
    let coordinates: CLLocationCoordinate2D
    
    init(dateLimite: Date, profil: Profil, coordinates: CLLocationCoordinate2D) {
        self.dateLimite = dateLimite
        self.profil = profil
        self.coordinates = coordinates
    }
    
    static func makeAnnonceForInit(dateLimite: Date, profil: Profil, coordinates: CLLocationCoordinate2D) -> AnnonceReparateur {
        let result = AnnonceReparateur(dateLimite: dateLimite, profil: profil, coordinates: coordinates)
        
        profil.annonceReparateur = result
        
        return result
    }
}
