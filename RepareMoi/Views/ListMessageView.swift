//
//  ListMessageView.swift
//  RepareMoi
//
//  Created by Apprenant 78 on 14/12/2021.
//

import SwiftUI
struct ListMessageView: View {
    @StateObject var viewModelChat = ChatsViewModel()
    @State private var searchContact = ""
    @State var seeMessage: MessageView
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModelChat.getSortedFilteredChats(searchContact: searchContact)) { user in
                    
                    ZStack {
                        
                        ChatRow(chat: user)
                        
                        NavigationLink(destination: {
                          
                            MessageView(chat: user )
                                .environmentObject(viewModelChat)
                        }) {
                        EmptyView()
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: 0)
                        .opacity(0)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button(action: {
                            viewModelChat.markAsUnread(!user.hasUnreadMessage, chat: user)
                        }, label: {
                            if user.hasUnreadMessage {
                                Label("Lire", systemImage: "text.bubble")
                            } else {
                                Label("Non lu", systemImage: "circle.fill")
                            }
                        })
                            .tint(.blue)
                    }
                    
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        viewModelChat.chats.remove(at: index)
                    }
                })
            }
            .listStyle(PlainListStyle())
            .searchable(text: $searchContact)
            .navigationTitle("Messages")
        }
    }
}
struct ChatRow: View {
    let chat: Chat
    
    var dateFormat = DateFormatter()
    
    init(chat: Chat) {
        self.chat = chat
        dateFormat.dateFormat = "EEEE H:m:s"
        dateFormat.locale = Locale(identifier: "FR-fr")
    }
    
    var body: some View {
        HStack {
            if chat.person.image != nil {
                chat.person.image!
                    .resizable()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
            }
            else {
                Circle()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.gray)
            }
//            chat.person.image!
//                .resizable()
//                .frame(width: 70, height: 70)
//                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(chat.person.nom)
                    .bold()
                    .padding(.vertical, 5)
                HStack() {
                    Text(chat.messages.last?.text ?? "")
                        .foregroundColor(chat.hasUnreadMessage ? .black : .gray)
                        .fontWeight(chat.hasUnreadMessage ? .bold : .regular)
                    .lineLimit(2)
                    .frame(height: 50, alignment: .top)
                    
                }
            }
            Spacer()
            Text(dateFormat.string(from: chat.messages.last?.date ?? Date()))
                .foregroundColor(chat.hasUnreadMessage ? .blue : .gray)
                .padding(.horizontal, 2)
        }
    }
}
struct ListMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ListMessageView(seeMessage: MessageView(chat: Chat(person: profilTest, messages: [
            MessageL("bonjour jojo", type : .Sent, date: Date(timeIntervalSinceNow: -86400 * 3), photo: nil),
            MessageL("bonjour tu peux m'aider", type : .Sent, date: Date(timeIntervalSinceNow: -86400 * 3), photo: nil),
        ], hasUnreadMessage: false)))
        ChatRow(chat: Chat.sampleChat[1])
    }
}
