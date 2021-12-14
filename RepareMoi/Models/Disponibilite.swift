//
//  Disponibilite.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 01/12/2021.
//

import Foundation

enum Disponibilite: String {
    case semaine = "La semaine"
    case weekEnd = "En week-end"
    case toutLeTemps = "Tout le temps"
}

extension Disponibilite {
    
    static func fromString(_ str: String) -> Disponibilite {
        switch(str) {
            case Disponibilite.semaine.rawValue:
                return .semaine
            case Disponibilite.weekEnd.rawValue:
                return .weekEnd
            case Disponibilite.toutLeTemps.rawValue:
                return .toutLeTemps
            default:
            return .semaine
        }
    }
    
}
