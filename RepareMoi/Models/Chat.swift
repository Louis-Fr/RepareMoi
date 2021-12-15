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
        Chat(person: Profil(nom: "Franck Dumas", description: "je suis réparateur", disponibilite: .semaine,appareils: [appareils[0]],annoncesReparation: [annoncesUtilisateurs[0]],annonceReparateur: nil, image: Image("AlbertDupond")), messages: [
            MessageL("Bonjour, quel est votre problème", type : .Sent, date: Date(timeIntervalSinceNow: -86400 * 3), photo: nil),
            MessageL("Salut, j'ai un problème avec l'écran de mon iphone", type : .Received, date: Date(timeIntervalSinceNow: -86400 * 3), photo: nil),
        ], hasUnreadMessage: true),
        Chat(person: profilTest, messages: [
            MessageL("Bonjour Albert vous êtes disponible?", type : .Sent, date: Date(timeIntervalSinceNow: -86400 * 3), photo: nil),
            MessageL("Oui bien sûr, vous êtes disponible ce weekend?", type : .Received, date: Date(), photo: nil),
        ], hasUnreadMessage: false),
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
