//
//  Databases.swift
//  RepareMoi
//
//  Created by Lucas RAULIER on 30/11/2021.
//

import Foundation

var appareils : [Appareil] = [
    Appareil(typeAppareil: .ordinateur, marqueAppareil: AppareilMarque_Ordinateur.hp, typeAchat: .neuf, anneeAchat: 2018, modele: "iPhone 8", image: "iPhone", empreinte: Empreinte.iphone8)
]

var annoncesUtilisateurs: [AnnonceUtilisateur] = [
    AnnonceUtilisateur(title: "Réparation iPhone SE", typeAppareil: .smartphone, description: "Mon appareil à l'écran cassé, je ne peux pas utiliser le tactile", urgent: true, disponibilite: .semaine, image: nil)
]

var annoncesReparateur: [AnnonceReparateur] = [
    //AnnonceReparateur(profil: profilTest, competence: [CompetenceAppareil.ordinateur:3])
]

var profilTest = Profil(nom: "Albert Dupont", description: "Mes parents ne m'aiment pas", disponibilite: .semaine, appareils: [appareils[0]], annoncesReparation: [], annonceReparateur: AnnonceReparateur.vide, image: nil)
