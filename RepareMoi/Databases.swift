//
//  Databases.swift
//  RepareMoi
//
//  Created by Lucas RAULIER on 30/11/2021.
//

import Foundation
import CoreLocation

//APPAREILS

var appareils : [Appareil] = [
    Appareil(typeAppareil: .ordinateur, marqueAppareil: AppareilMarque_Ordinateur.hp, typeAchat: .neuf, anneeAchat: 2018, modele: "HP", image: "iPhone", empreinte: Empreinte.iphone8),
    Appareil(typeAppareil: .ordinateur, marqueAppareil: AppareilMarque_Ordinateur.msi, typeAchat: .occasion, anneeAchat: 2019, modele: "MSI", image: "iPhone", empreinte: Empreinte.iphoneX)
]

//PROFILS

var profilTest = Profil(nom: "Albert Dupont", description: "Mes parents ne m'aiment pas", disponibilite: .semaine, appareils: [appareils[0]], annoncesReparation: [], annonceReparateur: nil, image: nil)

var profilTest2 = Profil(nom: "Joséphine Danate", description: "Mes parents ne m'aiment pas non plus", disponibilite: .weekEnd, appareils: [appareils[1], appareils[1]], annoncesReparation: [], annonceReparateur: nil, image: nil)

var profilTest3 = Profil(nom: "Camille Jano", description: "Mes parents ne m'aiment toujours pas (triste)", disponibilite: .weekEnd, appareils: [appareils[0], appareils[1]], annoncesReparation: [], annonceReparateur: nil, image: nil)

//ANNONCES

var annoncesUtilisateurs: [AnnonceUtilisateur] = [
    AnnonceUtilisateur.makeAnnonceForInit(title: "Réparation iPhone SE", appareil: appareils[0], description: "Mon appareil à l'écran cassé, je ne peux pas utiliser le tactile", urgent: true, disponibilite: .semaine, image: nil, coordinates: CLLocationCoordinate2D(latitude: Double.random(in: -90...90), longitude: Double.random(in: -180...180)),profil: profilTest),
    AnnonceUtilisateur.makeAnnonceForInit(title: "Réparation iPhone SE", appareil: appareils[1], description: "Mon appareil à l'écran cassé, je ne peux pas utiliser le tactile", urgent: true, disponibilite: .semaine, image: nil, coordinates: CLLocationCoordinate2D(latitude: Double.random(in: -90...90), longitude: Double.random(in: -180...180)),profil: profilTest2),
    AnnonceUtilisateur.makeAnnonceForInit(title: "Réparation iPhone X", appareil: appareils[0], description: "Mon appareil à l'écran cassé, je ne peux plus utiliser le tactile", urgent: false, disponibilite: .weekEnd, image: nil, coordinates: CLLocationCoordinate2D(latitude: Double.random(in: -90...90), longitude: Double.random(in: -180...180)),profil: profilTest2),
    AnnonceUtilisateur.makeAnnonceForInit(title: "Réparation iPhone X", appareil: appareils[0], description: "Mon appareil à l'écran cassé, je ne peux plus utiliser le tactile", urgent: false, disponibilite: .weekEnd, image: nil, coordinates: CLLocationCoordinate2D(latitude: Double.random(in: -90...90), longitude: Double.random(in: -180...180)),profil: profilTest3),
    AnnonceUtilisateur.makeAnnonceForInit(title: "Réparation iPhone 13 Pro", appareil: appareils[1], description: "Mon appareil à l'écran cassé, je ne peux plus utiliser le tactile", urgent: true, disponibilite: .weekEnd, image: nil, coordinates: CLLocationCoordinate2D(latitude: Double.random(in: -90...90), longitude: Double.random(in: -180...180)),profil: profilTest3),
]

func getDate(date: String) -> Date {
    let dateF = DateFormatter()
    dateF.dateFormat = "dd/MM/yyyy"
    
    return dateF.date(from: date)!
}

var annoncesReparateur: [AnnonceReparateur] = [
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: profilTest2, coordinates: CLLocationCoordinate2D(latitude: Double.random(in: -90...90), longitude: Double.random(in: -180...180))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: profilTest3, coordinates: CLLocationCoordinate2D(latitude: Double.random(in: -90...90), longitude: Double.random(in: -180...180))),
]
