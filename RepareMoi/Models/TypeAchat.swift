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


