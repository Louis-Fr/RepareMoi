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
        case ordinateur, tablette, smartphone, montreConnecte
        
    }
    



