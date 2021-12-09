//
//  Profil.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 01/12/2021.
//

import Foundation
import SwiftUI

class Profil: Identifiable {
    let id = UUID()
    var nom: String
    var description: String
    var disponibilite: Disponibilite
    var appareils: [Appareil]
    var annoncesReparation: [AnnonceUtilisateur]
    weak var annonceReparateur: AnnonceReparateur?
    var image: Image?
    //Les compétences du profil si il à été déclaré en mode réparateur au moins une fois
    var competence: [CompetenceAppareil:Int] = [:]
    
    public static let profilVide = Profil(nom: "", description: "", disponibilite: .toutLeTemps, appareils: [], annoncesReparation: [], annonceReparateur: nil, image: nil)
    
    init(nom: String, description: String, disponibilite: Disponibilite, appareils: [Appareil], annoncesReparation: [AnnonceUtilisateur], annonceReparateur: AnnonceReparateur?, image: Image?) {
        self.nom = nom
        self.description = description
        self.disponibilite = disponibilite
        self.appareils = appareils
        self.annoncesReparation = annoncesReparation
        self.annonceReparateur = annonceReparateur
        self.image = image
    }
    
    var isReparateur: Bool {
        return annonceReparateur != nil
    }
    
    //Fonction pour sauvegarder le profil dans les préférences utilisateur - A FAIRE
    func saveToUserDefaults() {
        
    }
    
    //Fonction pour charger le profil depuis les préférences utilisateur - A FAIRE
    func loadFromUserDefaults() {
        
    }
}
