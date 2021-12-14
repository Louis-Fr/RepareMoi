//
//  AppareilCategorie.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 01/12/2021.
//

import Foundation
import SwiftUI
// Modification pour CreationAnnonceUtilisateur
// Ajout de String, caseIterable, Identifiable,
    
enum AppareilCategory: String, CaseIterable, Identifiable  {
    var id: String {self.rawValue}
    case ordinateur = "Ordinateur"
    case tablette = "Tablette"
    case smartphone = "Smartphone"
    case montreConnecte = "Montre connectée"
}
    
extension AppareilCategory {
    
    //Donne l'enum en fonction de la rawVlue donnée.
    static func fromString(_ str: String) -> AppareilCategory {
        switch(str) {
            case AppareilCategory.ordinateur.id:
                return .ordinateur
            case AppareilCategory.smartphone.id:
                return .smartphone
            case AppareilCategory.tablette.id:
                return .tablette
            case AppareilCategory.montreConnecte.id:
                return .montreConnecte
            default:
            return .ordinateur
        }
    }
}


