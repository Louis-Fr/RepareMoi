//
//  Empreinte.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 01/12/2021.
//

import Foundation

struct Appareil {
    let typeAppareil: AppareilCategory
    let marqueAppareil: AppareilMarque
    let typeAchat: TypeAchat
    let anneeAchat: Int
    let modele: String
    let image: String
    let empreinte: Empreinte
    
    init(typeAppareil: AppareilCategory, marqueAppareil: AppareilMarque, typeAchat: TypeAchat, anneeAchat: Int, modele: String, image: String, empreinte: Empreinte) {
        self.typeAppareil = typeAppareil
        self.marqueAppareil = marqueAppareil
        self.typeAchat = typeAchat
        self.anneeAchat = anneeAchat
        self.modele = modele
        self.image = image
        self.empreinte = empreinte
    }
    
    //Fonction pour calculer l'empreinte de l'appareil - A FAIRE
    func calculerEmpreinte() -> Double {
        let currentDateTime = Date()
        let userCalendar = Calendar.current
        
        let requestedComponents: Set<Calendar.Component> = [
            .year
        ]
        let dateTimeComponents = userCalendar.dateComponents(requestedComponents, from: currentDateTime)
        
        let currentAnnee = dateTimeComponents.year ?? -1
        
        if currentAnnee == -1 {
            return -1
        }
        else {
            return empreinte.calculerEmpreinteMoyenne(anneeUse:currentAnnee-self.anneeAchat)
        }
    }
}
