//
//  Annonce.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 01/12/2021.
//

import Foundation
import SwiftUI
import CoreLocation

struct AnnonceUtilisateur: Identifiable, Equatable {
    static func == (lhs: AnnonceUtilisateur, rhs: AnnonceUtilisateur) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    let title: String
    let appareil: Appareil
    let description: String
    let urgent: Bool
    let disponibilite: Disponibilite
    let image: Image?
    let coordinates: CLLocationCoordinate2D
//    let profil: Profil
}
