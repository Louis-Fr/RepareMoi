//
//  Databases.swift
//  RepareMoi
//
//  Created by Lucas RAULIER on 30/11/2021.
//

import Foundation
import CoreLocation
import SwiftUI

//APPAREILS

var appareils : [Appareil] = [
    Appareil(typeAppareil: .ordinateur, marqueAppareil: AppareilMarque_Ordinateur.hp, typeAchat: .neuf, anneeAchat: 2018, modele: "HP", image: "ordinateur_DefaultImage", empreinte: Empreinte.iphone8),
    Appareil(typeAppareil: .smartphone, marqueAppareil: AppareilMarque_Smartphone.iPhone, typeAchat: .occasion, anneeAchat: 2019, modele: "Iphone 8", image: "smartphone_DefaultImage", empreinte: Empreinte.iphoneX),
    Appareil(typeAppareil: .tablette, marqueAppareil: AppareilMarque_Tablette.iPad, typeAchat: .occasion, anneeAchat: 2021, modele: "Ipad Pro", image: "tablette_DefaultImage", empreinte: Empreinte.iphone8Plus),
    Appareil(typeAppareil: .montreConnecte, marqueAppareil: AppareilMarque_Montre.iWatch, typeAchat: .occasion, anneeAchat: 2015, modele: "IWatch", image: "tablette_DefaultImage", empreinte: Empreinte.iphone8)
]

//PROFILS

fileprivate let descriptionsHomme = ["Bonjour je suis réparateur!",
                                "Je répare des PC et des trucs et je suis le meilleur",
                                "Réparer des trucs c'est ma passion. :D",
                                "J'habite a Béthancourt si ça vous intéresse!",
                                "Je suis spécialiste de la réparation des montres! Appelez-moi si besoin :p",
                                "Je suis spécialiste de la réparation des ordinateurs! Appelez-moi si besoin :p",
                                "Je suis spécialiste de la réparation des smartphones! Appelez-moi si besoin :p",
                                "Je suis spécialiste de la réparation des tablettes! Appelez-moi si besoin :p",
                                "Je suis parisien... Voila, c'est tout.",
                                "Je suis très maladroit, au secours",
                                "Bonjour, je suis sur Paris si vous avez besoin d'une réparation",
                                "Je suis si fatigué patron, si fatigué...",
                                "Salut, je viens du repair café de Montreuil, je répare des trucs du coup :)",
                                "Yo, j'adore manger des sushis",
                                "Yo, je peux vous réparer votre smartphone si jamais, je suis disponible toute la semaine",
                                "Réparant des appareils depuis 1994, je pense être apte a raviver vos appareils cassés"]

fileprivate let descriptionsFemme = ["Bonjour je suis réparatrice!",
                                "Je répare des PC et des trucs et je suis la meilleure",
                                "Réparer des trucs c'est ma passion. :D",
                                "J'habite a Béthancourt si ça vous intéresse!",
                                "Je suis spécialiste de la réparation des montres! Appelez-moi si besoin :p",
                                "Je suis spécialiste de la réparation des ordinateurs! Appelez-moi si besoin :p",
                                "Je suis spécialiste de la réparation des smartphones! Appelez-moi si besoin :p",
                                "Je suis spécialiste de la réparation des tablettes! Appelez-moi si besoin :p",
                                "Je suis parisienne... Voila, c'est tout.",
                                "Je suis très maladroite, au secours",
                                "Bonjour, je suis sur Paris si vous avez besoin d'une réparation",
                                "Je suis si fatiguée patron, si fatiguée...",
                                "Salut, je viens du repair café de Montreuil, je répare des trucs du coup :)",
                                "Yo, j'adore manger des sushis",
                                "Yo, je peux vous réparer votre smartphone si jamais, je suis disponible toute la semaine",
                                "Réparant des appareils depuis 1994, je pense être apte a raviver vos appareils cassés"]

fileprivate let noms = ["Makanam", "Versult", "Rali", "Mirat", "Tarim", "Miki", "Sahit", "Fouilloz", "Patin", "Safra", "Canate", "Danate", "Frapra", "Karan", "Kara", "Taneta", "Pintre", "Kuntra", "Juntu", "Quanto", "Crate", "Netamon"]

fileprivate let prenomHommes = ["Jean-Baptiste", "Jonathan", "Germain", "René", "Alfred", "Mathias", "Louis", "Nyl", "Lucas", "Jean", "John", "Ahmed", "Mahmoud", "Omar", "Benjamin", "Camille", "Joseph", "Patrick", "Bruce", "Marc", "Roger", "Robert"]
fileprivate let prenomFemmes = ["Audrey", "Marie", "Éleanore", "Patrice", "Patricia", "Mélanie", "Géraldine", "Anne", "Anna", "Anita", "Jade", "Camille", "Sarah", "Jeanne", "Emilie", "Margaux", "Océane", "Morgane", "Anne-Sophie"]

fileprivate let imagesHommes = ["AlbertDupond", "ben-parker", "default-avatar", "Obama"]
fileprivate let imagesFemmes = ["default-avatar", "mathilde", "imagepickerProfil", "profil2"]

fileprivate func generateProfils(nb: Int) -> [Profil] {
    var result: [Profil] = []
    
    for _ in 0..<nb {
        let isFemme = Bool.random()
        result.append(Profil(nom: "\( isFemme ? prenomFemmes[Int.random(in: 0..<prenomFemmes.count)] : prenomHommes[Int.random(in: 0..<prenomHommes.count)]) \(noms[Int.random(in: 0..<noms.count)])",
                             description: isFemme ? descriptionsFemme[Int.random(in: 0..<descriptionsFemme.count)] : descriptionsHomme[Int.random(in: 0..<descriptionsHomme.count)],
                             disponibilite: Disponibilite.random(),
                             appareils: [],
                             annoncesReparation: [],
                             annonceReparateur: nil,
                             image: isFemme ? Image(imagesFemmes[Int.random(in: 0..<imagesFemmes.count)]) : Image(imagesHommes[Int.random(in: 0..<imagesHommes.count)])))
    }
    
    return result
}

var profilTest = Profil(nom: "Mathilde Sauti", description: "J'ai un appareil à réparer avec la piéce de rechange mais je ne sais comment m'y prendre. J'aimerais qu'on puisse me donner un coup de main :)", disponibilite: .semaine, appareils: [appareils[0]], annoncesReparation: [], annonceReparateur: nil, image: Image("mathilde"), competence: [CompetenceAppareil.ordinateur: 3, CompetenceAppareil.smartphone: 2])

var profilTest2 = Profil(nom: "Joséphine Danate", description: "Mes parents ne m'aiment pas non plus", disponibilite: .weekEnd, appareils: [appareils[1], appareils[1]], annoncesReparation: [], annonceReparateur: nil, image: Image("default-avatar"))

var profilTest3 = Profil(nom: "Camille Jano", description: "Mes parents ne m'aiment toujours pas (triste)", disponibilite: .weekEnd, appareils: [appareils[0], appareils[1]], annoncesReparation: [], annonceReparateur: nil, image: Image("AlbertDupond"))

var otherProfilTests = generateProfils(nb: 120)

//ANNONCES

let degreeEparpillement = 1.0

fileprivate func generateAnnoncesUser(nb: Int, makeAnnonceForCurrentUser: Bool) -> [AnnonceUtilisateur] {
    var result: [AnnonceUtilisateur] = []
    for _ in 0..<nb {
        result.append(AnnonceUtilisateur.makeAnnonceForInit(title: "Mon appareil est cassé!", appareil: appareils[Int.random(in: 0..<appareils.count)], description: "Aidez moi s'il vous plait!", urgent: Bool.random(), disponibilite: .toutLeTemps, image: nil, coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement)), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)]))
    }
    
    if makeAnnonceForCurrentUser {
        result.append(AnnonceUtilisateur.makeAnnonceForInit(title: "Ecran Cassé", appareil: appareils[0], description: "l'Ecran est fissuré n'affiche plus rien. Au secours!", urgent: true, disponibilite: .toutLeTemps, image: nil, coordinates:  CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -degreeEparpillement...degreeEparpillement), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement)), profil: profilTest))
    }
    
    return result
}

var annoncesUtilisateurs = generateAnnoncesUser(nb: 90, makeAnnonceForCurrentUser: true)

func getDate(date: String) -> Date {
    let dateF = DateFormatter()
    dateF.dateFormat = "dd/MM/yyyy"
    
    return dateF.date(from: date)!
}

fileprivate func generateAnnoncesReparateur(nb: Int, makeAnnonceForCurrentUser: Bool) -> [AnnonceReparateur] {
    var result: [AnnonceReparateur] = []
    
    for _ in 0..<nb {
        let jour = 1+Int.random(in: 0..<27)
        let mois = 1+Int.random(in: 0..<12)
        let annee = 2021 + Int.random(in: 0..<3)
        let dateString = "\(jour < 10 ? "0\(jour)" : String(jour))/\(mois < 10 ? "0\(mois)" : String(mois) )/\(annee)"
        
        result.append(AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: dateString), profil: otherProfilTests[Int.random(in: 0..<otherProfilTests.count)], coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -0.5...0.5), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))))
    }
    
    if makeAnnonceForCurrentUser {
        result.append(AnnonceReparateur.makeAnnonceForInit(dateLimite: getDate(date: "15/10/2022"), profil: profilTest, coordinates: CLLocationCoordinate2D(latitude: 48.8566 + Double.random(in: -0.5...0.5), longitude: 2.3522 + Double.random(in: -degreeEparpillement...degreeEparpillement))))
    }
    
    return result
}

var annoncesReparateur: [AnnonceReparateur] = generateAnnoncesReparateur(nb: 50, makeAnnonceForCurrentUser: false)
