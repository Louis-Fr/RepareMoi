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
    Appareil(typeAppareil: .ordinateur, marqueAppareil: AppareilMarque_Ordinateur.hp, typeAchat: .neuf, anneeAchat: 2018, modele: "HP", image: "ordinateur_DefaultImage", empreinte: Empreinte.iphone8),
    Appareil(typeAppareil: .smartphone, marqueAppareil: AppareilMarque_Smartphone.iPhone, typeAchat: .occasion, anneeAchat: 2019, modele: "Iphone 8", image: "smartphone_DefaultImage", empreinte: Empreinte.iphoneX),
    Appareil(typeAppareil: .tablette, marqueAppareil: AppareilMarque_Tablette.iPad, typeAchat: .occasion, anneeAchat: 2021, modele: "Ipad Pro", image: "tablette_DefaultImage", empreinte: Empreinte.iphone8Plus),
    Appareil(typeAppareil: .montreConnecte, marqueAppareil: AppareilMarque_Montre.iWatch, typeAchat: .occasion, anneeAchat: 2015, modele: "IWatch", image: "tablette_DefaultImage", empreinte: Empreinte.iphone8)
]

//PROFILS

var profilTest = Profil(nom: "Albert Dupont", description: "Mes parents ne m'aiment pas", disponibilite: .semaine, appareils: [appareils[0]], annoncesReparation: [], annonceReparateur: nil, image: nil)

var profilTest2 = Profil(nom: "Joséphine Danate", description: "Mes parents ne m'aiment pas non plus", disponibilite: .weekEnd, appareils: [appareils[1], appareils[1]], annoncesReparation: [], annonceReparateur: nil, image: nil)

var profilTest3 = Profil(nom: "Camille Jano", description: "Mes parents ne m'aiment toujours pas (triste)", disponibilite: .weekEnd, appareils: [appareils[0], appareils[1]], annoncesReparation: [], annonceReparateur: nil, image: nil)

var otherProfilTests = Array(repeating: Profil(nom: "Test", description: "Je suis un placeholder", disponibilite: .weekEnd, appareils: [appareils[0], appareils[1]], annoncesReparation: [], annonceReparateur: nil, image: nil), count: 100)

//ANNONCES

let degreeEparpillement = 1.0

fileprivate func generateAnnoncesUser(nb: Int) -> [AnnonceUtilisateur] {
    var result: [AnnonceUtilisateur] = []
    for _ in 0..<nb {
        result.append(AnnonceUtilisateur.makeAnnonceForInit(title: "Mon appareil est cassé!", appareil: appareils[Int.random(in: 0..<appareils.count)], description: "Aidez moi s'il vous plait!", urgent: Bool.random(), disponibilite: .toutLeTemps, image: nil, coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement)), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)]))
    }
    
    return result
}

var annoncesUtilisateurs = generateAnnoncesUser(nb: 120)

func getDate(date: String) -> Date {
    let dateF = DateFormatter()
    dateF.dateFormat = "dd/MM/yyyy"
    
    return dateF.date(from: date)!
}

var annoncesReparateur: [AnnonceReparateur] = [
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: profilTest2, coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -0.5...0.5), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: profilTest3, coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -0.5...0.5), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
    AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "08/02/2022"), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))),
]
