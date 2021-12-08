//
//  AnnonceRéparateur.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 02/12/2021.
//

import Foundation

import SwiftUI
import CoreLocation

struct AnnonceReparateur : Equatable, Identifiable {
    static func == (lhs: AnnonceReparateur, rhs: AnnonceReparateur) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    let dateLimite: String
//    let profil: Profil
    let coordinates: CLLocationCoordinate2D
    
    static let vide = AnnonceReparateur(dateLimite: "01/01/0000", coordinates: CLLocationCoordinate2D(latitude: 0, longitude: 0))
}
