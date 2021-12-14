//
//  Chat.swift
//  RepareMoi
//
//  Created by Apprenant 78 on 14/12/2021.
//

import Foundation
import UIKit

struct Chat: Identifiable {
    var id: UUID { person.id }
    let person: Profil
    var messages: [MessageL]
    var hasUnreadMessage = false
}

extension Chat {
    
    static let sampleChat = [
        Chat(person: Profil(nom: "coco jojo", description: "je suis réparateur", disponibilite: .semaine,appareils: [appareils[0]],annoncesReparation: [annoncesUtilisateurs[0]],annonceReparateur: nil, image: nil), messages: [
            MessageL("bonjour jojo", type : .Sent, date: Date(timeIntervalSinceNow: -86400 * 3), photo: nil),
            MessageL("bonjour tu peux m'aider", type : .Received, date: Date(timeIntervalSinceNow: -86400 * 3), photo: nil),
        ], hasUnreadMessage: true),
        Chat(person: profilTest, messages: [
            MessageL("C'est albert coco jojo", type : .Sent, date: Date(timeIntervalSinceNow: -86400 * 3), photo: nil),
            MessageL("C'est albert coco jojo numéro 2 nuebe", type : .Received, date: Date(), photo: nil),
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
