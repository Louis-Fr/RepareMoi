//
//  ChatsViewModel.swift
//  RepareMoi
//
//  Created by Apprenant 78 on 14/12/2021.
//

import SwiftUI
import UIKit

class ChatsViewModel: ObservableObject {
    @Published var chats = Chat.sampleChat
    
    func getSortedFilteredChats(searchContact: String) -> [Chat] {
        let sortedChats = chats.sorted {
            guard let date1 = $0.messages.last?.date else { return false }
            guard let date2 = $1.messages.last?.date else { return false }
            return date1 > date2
        }
        
        if searchContact == "" {
            return sortedChats
        }
        return sortedChats.filter { $0.person.nom.lowercased().contains(searchContact.lowercased())}
    }
    
    func markAsUnread(_ newValue: Bool, chat: Chat) {
        if let index = chats.firstIndex(where: { $0.id == chat.id }) {
            chats[index].hasUnreadMessage = newValue
        }
    }
    
    func sendMessage(_ text: String, photo: UIImage?, in chat: Chat) -> MessageL? {
        if let index = chats.firstIndex(where: { $0.id == chat.id }) {
            let message = MessageL(text, type: .Sent, photo: photo)
            chats[index].messages.append(message)
            return message
        }
        return nil
    }
}
