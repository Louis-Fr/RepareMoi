//
//  Annonce.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 01/12/2021.
//

import Foundation
import SwiftUI

struct AnnonceReparation {
    let title: String
    let typeAppareil: AppareilCategory
    let description: String
    let urgent: Bool
    let disponibilite: Disponibilite
    let image: Image?
}
