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
    let annonces: [Annonce]
    let image: Image?
    //Dictionnaire optionnel pour savoir si le profil est un profil réparateur, si vide, c'est un profil utilisateur .Si le profil est un profil réparateur, le dictionnaire donne les compétences et leurs niveaux
    let competence: [CompetenceAppareil:Int]
    
    var isReparateur: Bool {
        return competence.isEmpty
    }
    
    //Fonction pour sauvegarder le profil dans les préférences utilisateur - A FAIRE
    func saveToUserDefaults() {
        
    }
    
    //Fonction pour charger le profil depuis les préférences utilisateur - A FAIRE
    func loadFromUserDefaults() {
        
    }
}
