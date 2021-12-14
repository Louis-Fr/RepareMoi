//
//  TypeAchat.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 01/12/2021.
//

import Foundation

enum TypeAchat : String, CaseIterable, Identifiable {
    var id: String {self.rawValue}
    case neuf = "Neuf"
    case occasion = "Occasion"
    case reconditionne = "Reconditionne"
}

extension TypeAchat {
    
    mutating func fromString(_ str: String) -> TypeAchat {
        switch(str) {
            case TypeAchat.neuf.rawValue:
                return .neuf
            case TypeAchat.occasion.rawValue:
                return .occasion
            case TypeAchat.reconditionne.rawValue:
                return .reconditionne
            default:
                return .neuf
        }
    }
}
