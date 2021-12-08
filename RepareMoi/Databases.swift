//
//  Databases.swift
//  RepareMoi
//
//  Created by Lucas RAULIER on 30/11/2021.
//

import Foundation
import CoreLocation

var appareils : [Appareil] = [
    Appareil(typeAppareil: .ordinateur, marqueAppareil: AppareilMarque_Ordinateur.hp, typeAchat: .neuf, anneeAchat: 2018, modele: "iPhone 8", image: "iPhone", empreinte: Empreinte.iphone8)
]

var annoncesUtilisateurs: [AnnonceUtilisateur] = [
    AnnonceUtilisateur(title: "Réparation iPhone SE", appareil: appareils[0], description: "Mon appareil à l'écran cassé, je ne peux pas utiliser le tactile", urgent: true, disponibilite: .semaine, image: nil, coordinates: CLLocationCoordinate2D(latitude: Double.random(in: -90...90), longitude: Double.random(in: -180...180))),
    AnnonceUtilisateur(title: "Réparation iPhone SE", appareil: appareils[0], description: "Mon appareil à l'écran cassé, je ne peux pas utiliser le tactile", urgent: true, disponibilite: .semaine, image: nil, coordinates: CLLocationCoordinate2D(latitude: Double.random(in: -90...90), longitude: Double.random(in: -180...180))),
    AnnonceUtilisateur(title: "Réparation iPhone SE", appareil: appareils[0], description: "Mon appareil à l'écran cassé, je ne peux pas utiliser le tactile", urgent: true, disponibilite: .semaine, image: nil, coordinates: CLLocationCoordinate2D(latitude: Double.random(in: -90...90), longitude: Double.random(in: -180...180))),
]

var annoncesReparateur: [AnnonceReparateur] = [
    //AnnonceReparateur(profil: profilTest, competence: [CompetenceAppareil.ordinateur:3])
    AnnonceReparateur(dateLimite: "08/02/2022", coordinates: CLLocationCoordinate2D(latitude: Double.random(in: -90...90), longitude: Double.random(in: -180...180))),
    AnnonceReparateur(dateLimite: "08/02/2022", coordinates: CLLocationCoordinate2D(latitude: Double.random(in: -90...90), longitude: Double.random(in: -180...180))),
]

var profilTest = Profil(nom: "Albert Dupont", description: "Mes parents ne m'aiment pas", disponibilite: .semaine, appareils: [appareils[0]], annoncesReparation: [annoncesUtilisateurs[0]], annonceReparateur: AnnonceReparateur.vide, image: nil)
