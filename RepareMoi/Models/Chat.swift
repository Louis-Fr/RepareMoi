//
//  Chat.swift
//  RepareMoi
//
//  Created by Apprenant 78 on 14/12/2021.
//

import Foundation
import UIKit
import SwiftUI

struct Chat: Identifiable {
    var id: UUID { person.id }
    let person: Profil
    var messages: [MessageL]
    var hasUnreadMessage = false
}

extension Chat {
    
    static let sampleChat = [
        Chat(person: Profil(nom: "Stéphanie Dupras", description: "je suis réparatrice", disponibilite: .semaine,appareils: [appareils[0]],annoncesReparation: [annoncesUtilisateurs[0]],annonceReparateur: nil, image: Image("AlbertDupond")), messages: [
            MessageL("Bonjour Jojo", type : .Sent, date: Date(timeIntervalSinceNow: -86400 * 3), photo: nil),
            MessageL("Salut, pourrais-tu m'aider?", type : .Received, date: Date(timeIntervalSinceNow: -86400 * 3), photo: nil),
        ], hasUnreadMessage: true),
        Chat(person: Profil(nom: "Mohammed", description: "J'ai besoin de faire réparer mon iPad", disponibilite: .toutLeTemps, appareils: appareils, annoncesReparation: [annoncesUtilisateurs[0]], annonceReparateur: nil, image: Image("ben-parker")), messages: [
            MessageL("Bonjour, vous êtes disponible?", type : .Sent, date: Date(timeIntervalSinceNow: -86400 * 3), photo: nil),
            MessageL("Oui bien sûr vers quel heure peut-on se donner rendez-vous?", type : .Received, date: Date(), photo: nil),
        ], hasUnreadMessage: false),
        Chat(person: profilTest, messages: [
            MessageL("Bonjour, vous êtes disponible?", type : .Sent, date: Date(timeIntervalSinceNow: -86400 * 3), photo: nil),
            MessageL("Oui bien sûr vers quel heure peut-on se donner rendez-vous?", type : .Received, date: Date(), photo: nil),
        ], hasUnreadMessage: false),
        Chat(person: profilTest, messages: [
            MessageL("Bonjour, vous êtes disponible?", type : .Sent, date: Date(timeIntervalSinceNow: -86400 * 3), photo: nil),
            MessageL("Oui bien sûr vers quel heure peut-on se donner rendez-vous?", type : .Received, date: Date(), photo: nil),
        ], hasUnreadMessage: false)
    ]
}

struct MessageL: Identifiable {
    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
    let photo: UIImage?
    
    enum MessageType: String {
        case Sent = "Envoyé"
        case Received = "Reçu"
    }
    
    init(_ text: String, type: MessageType, date: Date, photo: UIImage?) {
        self.date = date
        self.type = type
        self.text = text
        self.photo = photo
    }
    init(_ text: String, type: MessageType, photo: UIImage?) {
        self.init(text, type: type, date: Date(), photo: UIImage())
//    }
}

}
