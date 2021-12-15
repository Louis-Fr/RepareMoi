//
//  DetailAnnonce.swift
//  RepareMoi
//
//  Created by Louis REY on 08/12/2021.
//

import SwiftUI

struct DetailAnnonce: View {
    
    
    @State private var annonceImage = UIImage(named: "brokenSmartphoneLow")!
    
    @State private var selectionTchat = false
    @State var sheetOpenTchat: Bool = false
    @State var hasChangedTchat: Bool = false
    
    
    var body: some View {
        
        
        
        ZStack {
            
            
            
            // BACKGROUND
            
            
            Color("BaseColor")
                .ignoresSafeArea()
            
            Image("GraphicComponentLarge")
                .resizable()
                .rotationEffect(.degrees(-7))
                .frame(width: 300, height: 400)
                .offset(x: -80, y: -300)
                .opacity(0.4)
            
            Image("GraphicComponentLarge")
                .resizable()
                .rotationEffect(.degrees(-175))
                .frame(width: 300, height: 400)
                .offset(x: 80, y: -300)
                .opacity(0.4)
            
            
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.white)
                .frame(width: 445, height: 600)
                .offset(y: 175)

            
            
            
            
            VStack {
                
                
                // IMAGE & TITRE & DESCRIPTION
                
                
                Text("iPhone 6S avec l'écran HS")
                    .font(Font.system(size: 28, weight: .semibold))
                    .offset(y: 195)
                
                    
                Image(uiImage: annonceImage)
                    .resizable()
                    .frame(width: 330, height: 220)
                    .scaledToFill()
                    .cornerRadius(15)
                    .offset(y: -145)
                
                
                Text("**Description**")
                    .font(Font.system(size: 25, weight: .medium))
                    .offset(x: -120, y: -30)
            
                
                Text("J'ai fait tombé mon iPhone et l'écran c'est fissuré. Le téléphone s'allume toujours mais le tactile ne fonctionne plus. Ecran et chassis à changer, je viens de commander les pièces ! N'hésitez pas à me contacter :)")
                    .foregroundColor(.black)
                    .frame(width: 380, height: 200)
                    .offset(x: 6, y: -85)
                    
                
                
                
                ZStack {
                    
                    
                    // DISPONIBILITÉ
                    
                    
                    Text("**Disponibilité**")
                        .font(Font.system(size: 25, weight: .medium))
                        .offset(x: -115, y: -110)
                
                    
                    Text("Week-End")
                        .background(
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.green)
                                .frame(width: 120, height: 40)
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                            
                                )
                                .offset(x: -122, y: -59)
                    
                    
                    Text("Semaine")
                        .background(
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red)
                                .frame(width: 120, height: 40)
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                            
                                )
                                .offset(x: 20, y: -59)
                                .opacity(0.3)
                    
                    
                    // BOUTON VERS TCHAT
                    
                    
                    NavigationLink(
                        
                        destination: ProfilView(),
                        
                        label: {
                            
                            ZStack{
                                
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(Color("GrayCustom"))
                                .frame(width: 160, height: 50)
                            
                        // NavigationLink vers le tchat
                                
                            Text("Contacter")
                                    .foregroundColor(Color.white)
                                .font(.system(size: 25))
                                
                                } // FIN ZSTACK
                            
                        }).offset(y: 100)
                    
            
                } // VIN ZSTACK
                
            } // FIN VSTACK
            
        } // FIN ZSTACK
        
    } // FIN BODY

    

struct DetailAnnonce_Previews: PreviewProvider {
    static var previews: some View {
        DetailAnnonce()
    }
}
}
