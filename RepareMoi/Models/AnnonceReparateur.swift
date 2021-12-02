//
//  AnnonceRéparateur.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 02/12/2021.
//

import Foundation

import SwiftUI

struct AnnonceReparateur : Comparable {
    static func < (lhs: AnnonceReparateur, rhs: AnnonceReparateur) -> Bool {
        return lhs.dateLimite == rhs.dateLimite
    }
    
    let dateLimite: String
    
    static let vide = AnnonceReparateur(dateLimite: "01/01/0000")
}
