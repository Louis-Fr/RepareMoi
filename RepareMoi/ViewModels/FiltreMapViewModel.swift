//
//  FiltreUtilisateurViewModel.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 08/12/2021.
//

import Foundation

struct FiltreMapViewModel {
    var selectedAppareilType : AppareilCategory = .ordinateur
    var isReparateur: Bool = false
    var userHasPieces: Bool = false
    var wantedLocalization: String = ""
    
    static let 
}

struct FiltreData {
    var isReparateur: Bool
    var appareilType: AppareilCategory
}
