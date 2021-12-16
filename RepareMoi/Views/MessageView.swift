//
//  MessageView.swift
//  RepareMoi
//
//  Created by Apprenant 78 on 14/12/2021.
//

import SwiftUI

struct MessageView: View {
    @EnvironmentObject var viewModel: ChatsViewModel
    let chat: Chat
    
    
    @State private var text = ""
    @FocusState private var isFocused
    @State var imagePickerIsPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var messageIDToScroll: UUID?
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                
                GeometryReader { reader in
                    
                    ScrollView {
                        ScrollViewReader { scrollReader in
                            getMessagesView(viewWidth: reader.size.width)
                                .padding(.horizontal, 50)
                                .padding(.vertical, 70)
                                .onChange(of: messageIDToScroll) { _ in
                                    if let messageID = messageIDToScroll {
                                        scrollTo(messageID: messageID, shouldAnimate: true, scrollReader: scrollReader)
                                    }
                                }
                                .onAppear {
                                    if let messageID = chat.messages.last?.id {
                                        scrollTo(messageID: messageID, anchor: .bottom, shouldAnimate: false, scrollReader: scrollReader)
                                    }
                                }
                        }
                    }
                    
                }
                .padding(.bottom, 5)
                
                toolbarView()
                    .padding(.horizontal, 35)
            }
            .onAppear {
                viewModel.markAsUnread(false, chat: chat)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        
                        //                        Voir le profil
                        NavigationLink(destination: ProfilView(), label: {
                            CircleButtonChatView(iconName: "info")
                        })
                        
                        
                    }
                }
            }
            //         Header for profil
            Ellipse().ignoresSafeArea()
                .foregroundColor(Color("ColorVert"))
                .frame(width: 470, height: 250)
                .offset(y: -385)
                .shadow(radius: 5)
            VStack(alignment: .center) {
                Text(chat.person.nom)
                    .font(.body).bold()
                    .offset(y: -330)
                if chat.person.image != nil {
                    chat.person.image!
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 76, height: 76)
                        .offset(y: -325)
                } else {
                    Circle()
                        .frame(width: 76, height: 76)
                        .foregroundColor(.gray)
                        .offset(y: -325)
                    
                }
            }
            .sheet(isPresented: $imagePickerIsPresenting) {
                ImagePicker(uiImage: $uiImage, imagePickerIsPresenting: $imagePickerIsPresenting, sourceType: $sourceType)
            }
            
        }
    }
    
    func scrollTo(messageID: UUID, anchor: UnitPoint? = nil, shouldAnimate: Bool, scrollReader: ScrollViewProxy) {
        DispatchQueue.main.async {
            withAnimation(shouldAnimate ? Animation.easeIn : nil) {
                scrollReader.scrollTo(messageID, anchor: anchor)
            }
        }
    }
    
    func toolbarView() -> some View {
        VStack {
            let height: CGFloat = 37
            HStack {
                Image(systemName: "photo")
                    .onTapGesture {
                        imagePickerIsPresenting = true
                    }
                
                Image(systemName: "camera")
                    .onTapGesture {
                        imagePickerIsPresenting = true
                        sourceType = .camera
                    }
                
                TextField("Message ...", text: $text)
                    .padding(.horizontal, 10)
                    .frame(height: height)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .focused($isFocused)
                
                Button(action: sendMessage) {
                    
                    
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .frame(width: height, height: height)
                        .background(
                            Circle()
                                .foregroundColor(text.isEmpty ? .gray : .blue)
                        )
                }.disabled(text.isEmpty)
            }
            .frame(height: height)
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.thickMaterial)
    }
    func sendMessage() {
        
        if self.uiImage != nil {
            if let message = viewModel.sendMessage(text, photo: self.uiImage, in: chat) {
                text = ""
                messageIDToScroll = message.id
            }
        }
    }
    
    let columns = [GridItem(.flexible(minimum: 10))]
    
    func getMessagesView(viewWidth: CGFloat) -> some View {
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(chat.messages) { message in
                let isReceived = message.type == .Received
                HStack {
                    VStack(alignment: isReceived ? .leading : .trailing) {
                        
                        if chat.person.image != nil && isReceived {
                            
                            chat.person.image!
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                            
                                .clipShape(Circle())
                        } else {
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.gray)
                            
                        }
                        ZStack {
                            //                            if message.photo == nil {
                            Text(message.text)
                                .padding(.horizontal)
                                .padding(.vertical, 13)
                                .background(isReceived ? Color.black.opacity(0.2) :
                                                Color("ColorChat").opacity(0.9))
                                .cornerRadius(13)
                            //                            } //else {
                            //                                Image(uiImage: message.photo)
                            //                                    .resizable()
                            //                                    .scaledToFit()
                            //                                    .frame(width: UIScreen.main.bounds.width - 150, height: 150)
                            //                            }
                        }
                        .frame(width: viewWidth * 0.8, alignment: isReceived ? .leading : .trailing)
                        .padding(.vertical)
                    }
                    //                    .background(Color.blue)
                }
                .frame(maxWidth: .infinity, alignment: isReceived ? .leading : .trailing)
                .id(message.id)
            }
            
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MessageView(chat: Chat.sampleChat[1])
                .environmentObject(ChatsViewModel())
        }
    }
}
