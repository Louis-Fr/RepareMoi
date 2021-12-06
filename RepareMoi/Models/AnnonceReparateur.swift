//
//  AnnonceRéparateur.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 02/12/2021.
//

import Foundation

import SwiftUI

struct AnnonceReparateur : Equatable, Identifiable {
    static func == (lhs: AnnonceReparateur, rhs: AnnonceReparateur) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    let dateLimite: String
    
    static let vide = AnnonceReparateur(dateLimite: "01/01/0000")
}
