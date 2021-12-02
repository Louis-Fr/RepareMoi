//
//  Profil.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 01/12/2021.
//

import Foundation
import SwiftUI

struct Profil {
    let nom: String
    let description: String
    let disponibilite: Disponibilite
    let appareils: [Appareil]
    let annoncesReparation: [AnnonceUtilisateur]
    let annonceReparateur: AnnonceReparateur
    let image: Image?
    //Les compétences du profil si il à été déclaré en mode réparateur au moins une fois
    var competence: [CompetenceAppareil:Int] = [:]
    
    var isReparateur: Bool {
        return annonceReparateur == AnnonceReparateur.vide
    }
    
    //Fonction pour sauvegarder le profil dans les préférences utilisateur - A FAIRE
    func saveToUserDefaults() {
        
    }
    
    //Fonction pour charger le profil depuis les préférences utilisateur - A FAIRE
    func loadFromUserDefaults() {
        
    }
}
