//
//  DetailAnnonce.swift
//  RepareMoi
//
//  Created by Louis REY on 08/12/2021.
//

import SwiftUI

struct DetailAnnonce: View {
    
    @State private var showPhotoPickerAnnonce = false
    @State private var annonceImage = UIImage(named: "brokenSmartphoneLow")!
    
    @State private var selectionTchat = false
    @State var sheetOpenTchat: Bool = false
    @State var hasChangedTchat: Bool = false
    
    @State private var description = "J'ai fait tombé mon iPhone et l'écran c'est fissuré. Le téléphone s'allume toujours mais le tactile ne fonctionne plus. Ecran et chassis à changer, je viens de commander les pièces ! N'hésitez pas à me contacter :)"
    
    var body: some View {
        
        ZStack {
            Color("BaseColor")
                .ignoresSafeArea()
            
            // Récupérer image ajouter par l'utilisateur via ImagePicker
            VStack {
                Text("iPhone 6S avec l'écran HS")
                    .font(Font.system(size: 18, weight: .medium))
                
                    
                Image(uiImage: annonceImage)
                    .resizable()
                    .frame(width: 300, height: 200)
                    .scaledToFill()
                    .cornerRadius(15)
                    .onTapGesture { showPhotoPickerAnnonce = true }
                
            
            .sheet(isPresented: $showPhotoPickerAnnonce, content: {
                photoPickerAnnonce(annonceImage: $annonceImage)
            })
            .padding(35)
                
                
            Text("Description de l'annonce")
            .font(Font.system(size: 18, weight: .medium))
            
                
            TextEditor(text: $description)
            .cornerRadius(10)
            //.padding(.center)
            .foregroundColor(.black)
            .font(Font.system(size: 15, weight: .medium))
            .padding(7)
            //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("BaseColor"), lineWidth: 1))
            .frame(width: 325, height: 180)
            .padding(1)
            .shadow(radius: 5)
                
                HStack {
                    Text("📆    Disponibilité   ➜   Weekend")
                        .font(.body)
                        .font(Font.system(size: 18, weight: .medium))
                        .padding(.leading, 0)
                   /* Text("📆    ➜")
                    Text("Weekend")
                        .bold()
                        .padding(.trailing)
                        //.border(.selection, width: 1)
                        //.padding()
                    // Récupérer le statut du toggle */
                    
                    
                    //Spacer()
                        //.frame(height: 180)
                    .padding(30)
                }
                
              /*  Button(action: {
                    print("Appareil ajouté")
                }) {
                    Text("Répondre à l'annonce")
                        .frame(width: 250, height: 20)
                        .padding(15)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .background(.bar)
                        .cornerRadius(50) */
                
              /*   .onTapGesture {
                    sheetOpenTchat = true
                }
                .sheet(isPresented: $sheetOpenAddAppareil, , content: {
                    
                    ListMessageView(viewModelChat: <#T##ChatsViewModel#>, seeMessage: <#T##MessageView#>})
                    
                }) */
                
                
                
                
                
                
                
                
                
                
                
                
                
            }
            
            
            
            
            
            
            
        } // Fin Vstack
        
        
    }


struct DetailAnnonce_Previews: PreviewProvider {
    static var previews: some View {
        DetailAnnonce()
    }
}
}
