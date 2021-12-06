//
//  Annonce.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 01/12/2021.
//

import Foundation
import SwiftUI

struct AnnonceUtilisateur: Identifiable {
    let id = UUID()
    let title: String
//    let typeAppareil: AppareilCategory
    let appareil: Appareil
    let description: String
    let urgent: Bool
    let disponibilite: Disponibilite
    let image: Image?
}
