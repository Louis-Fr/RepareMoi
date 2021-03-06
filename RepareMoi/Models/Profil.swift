//
//  Profil.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 01/12/2021.
//

import Foundation
import SwiftUI

class Profil: Identifiable, Equatable, ObservableObject {
    static func == (lhs: Profil, rhs: Profil) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    var nom: String
    var description: String
    var disponibilite: Disponibilite
    @Published var appareils: [Appareil]
    @Published var annoncesReparation: [AnnonceUtilisateur]
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
    
    init(nom: String, description: String, disponibilite: Disponibilite, appareils: [Appareil], annoncesReparation: [AnnonceUtilisateur], annonceReparateur: AnnonceReparateur?, image: Image?, competence: [CompetenceAppareil:Int]) {
        self.nom = nom
        self.description = description
        self.disponibilite = disponibilite
        self.appareils = appareils
        self.annoncesReparation = annoncesReparation
        self.annonceReparateur = annonceReparateur
        self.image = image
        self.competence = competence
    }
    
    var isReparateur: Bool {
        return annonceReparateur != nil
    }
    
    //Fonction pour sauvegarder le profil dans les préférences utilisateur - A FAIRE
    func saveToUserDefaults() {
        /*UserDefaults.standard.set(self.nom, forKey: "user.nom")
        UserDefaults.standard.set(self.description, forKey: "user.description")
        UserDefaults.standard.set(self.disponibilite.rawValue, forKey: "user.disponibilite")*/
    }
    
    //Fonction pour charger le profil depuis les préférences utilisateur - A FAIRE
    func loadFromUserDefaults() -> Profil? {
        /*if let nom = UserDefaults.standard.string(forKey: "user.nom") {
            let description = UserDefaults.standard.string(forKey: "user.description") ?? ""
            let disponibilite = Disponibilite.fromString(UserDefaults.standard.string(forKey: "user.disponibilite") ?? "")
            
            return nil
        }*/
        
        return nil
    }
}




