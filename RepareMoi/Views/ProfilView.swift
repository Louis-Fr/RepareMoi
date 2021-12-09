//
//  ProfilView.swift
//  RepareMoi
//
//  Created by Audrey on 03/12/2021.
//

import SwiftUI

struct ProfilView: View {
    
    // BOUTON RETOUR CUSTOM
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

        var btnBack : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                Image(systemName: "arrow.left")
//                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color("GrayCustom"))
                    Text("Retour")
                        .foregroundColor(Color("GrayCustom"))
                        .font(.system(size: 20))
                }
            }
        }
    
    
    var body: some View {
       
            
        NavigationView {
            
            ZStack {
                
                ZStack{
                // FOND COULEUR & ELEMENTS
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("BaseColor"))
                    .frame(width: 500, height: 1000)
        
                
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
                    .offset(x: 60, y: -300)
                    .opacity(0.4)
                
                
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.white)
                    .frame(width: 400, height: 600)
                    .offset(y: 115)
                
                

                
                
                
                // IMAGE & NOM PROFIL
                
                Image("imagepickerProfil")
                    .scaledToFill()
                    .cornerRadius(25)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .offset(y: -370)
                
                Text("Mathilde Godit")
                    .font(.system(size: 25))
                    .bold()
                    .offset(y: -270)
                
                }
                
                
                
                
                // BOUTON CONTACTER
                // ! Besoin de créer la page "Message" pour link le bouton !
                // Dans l'attente, le lien mène à "CreationProfil"
                
                
                NavigationLink(
                    
                    destination: CreationProfil(),
                    
                    label: {
                        ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color("GrayCustom"))
                            .frame(width: 120, height: 30)
                        
// NavigationLink vers le tchat
                        Text("Contacter")
                            .foregroundColor(Color("BaseColor"))
                            .font(.system(size: 20))
                        }
                        
                    }).offset(y: -220)
                
               
            
                
                
            // BLOCK DESCRIPTION
                
                VStack {
            
                Text("**Description**")
                        .font(.system(size: 25))
                        .offset(x: -109, y: -38)
                        
                    
                Text("Bonjour, je répare des téléphones et des appareils pour un prix vraiment abordable, la gentillesse :) ")
                        .frame(width: 350, height: 200)
                        .offset(y: -118)
                
                } // FIN VSTACK
                
                
                
                // BLOCK AVIS
                
                VStack{
                    
                    
                    HStack{
                    Text("**Avis**")
                            .font(.system(size: 23))
                            .offset(x: -114)
                    
                    Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .offset(x: -90)
                        
                    Text("4.7/5")
                            .offset(x: -90)
                        
                        Text("(14)")
                            .foregroundColor(.gray)
                            .offset(x: -90)
                    
                    }.offset(x: 20, y: 285)
                    
                    
                    // STRUCTURES A FAIRE POUR + DE LISIBILITE & FONCTIONNALITE
                    
                    ScrollView(.horizontal){
                        
                    HStack{
                        
                        
                    PostedReview()
                        
                        
                    PostedReview()
                        
                        
                    PostedReview()
                        
                        
                        
                    } // FIN HSTACK
                        
                        
                    
                    }.offset(x: 58, y: 35) // FIN SCROLL VIEW
                    
            } // FIN VSTACK
                
                
              
                
            // BLOCK COMPETENCES
            
            VStack{
                
                
                
                Text("**Compétences**")
                    .font(.system(size: 25))
                    .offset(x: -15, y: 10)
                
                
                
                
                    Text("Ordinateurs")
                        .frame(width: 150, height: 40)
                        .offset(x: -45, y: -5)
                
                    ProgressCompBar1()
                        .offset(y: -20)
                
            
                
                
                Text("Smartphones")
                    .frame(width: 150, height: 40)
                    .offset(x: -38, y: -30)
                
                ProgressCompBar4()
                    .offset(y: -45)
                    
                
                
                
                Text("Tablettes")
                    .frame(width: 150, height: 40)
                    .offset(x: -55, y: -55)
                
                ProgressCompBar2()
                    .offset(y: -70)
                  
                
                
                
                Text("Autres")
                    .frame(width: 150, height: 40)
                    .offset(x: -65, y: -80)
                
                ProgressCompBar1()
                    .offset(y: -95)
                
                
                
                
            }.offset(x: -80, y: 275)
            // FIN VSTACK
                
                
               
                
                
            } // FIN ZSTACK
            
            
        }.navigationBarBackButtonHidden(true)
         .navigationBarItems(leading: btnBack)
         // FIN NAVIGATIONVIEW
        
    } // FIN BODY
    
} // FIN STRUCT


























// STRUCTURES VISUELLES POUR BARRE COMPETENCES



struct ProgressCompBar1: View {
    
    var body: some View {
        
        HStack {
            
            ProgressCompBarStartYellow()
            
            ProgressCompBarBasic()
                .offset(x: -5)
            
            ProgressCompBarBasic()
                .offset(x: -10)
            
            ProgressCompBarBasic()
                .offset(x: -15)
            
            ProgressCompBarEndBasic()
                .offset(x: -20)
            
        }
        
    }
    
}


struct ProgressCompBar2: View {
    
    var body: some View {
        
        HStack {
            
            ProgressCompBarStartYellow()
            
            ProgressCompBarYellow()
                .offset(x: -5)
            
            ProgressCompBarBasic()
                .offset(x: -10)
            
            ProgressCompBarBasic()
                .offset(x: -15)
            
            ProgressCompBarEndBasic()
                .offset(x: -20)
            
        }
        
    }
    
}


struct ProgressCompBar3: View {
    
    var body: some View {
        
        HStack {
            
            ProgressCompBarStartYellow()
            
            ProgressCompBarYellow()
                .offset(x: -5)
            
            ProgressCompBarYellow()
                .offset(x: -10)
            
            ProgressCompBarBasic()
                .offset(x: -15)
            
            ProgressCompBarEndBasic()
                .offset(x: -20)
            
        }
        
    }
    
}


struct ProgressCompBar4: View {
    
    var body: some View {
        
        HStack {
            
            ProgressCompBarStartYellow()
            
            ProgressCompBarYellow()
                .offset(x: -5)
            
            ProgressCompBarYellow()
                .offset(x: -10)
            
            ProgressCompBarYellow()
                .offset(x: -15)
            
            ProgressCompBarEndBasic()
                .offset(x: -20)
            
        }
        
    }
    
}



struct ProgressCompBar5: View {
    
    var body: some View {
        
        HStack {
            
            ProgressCompBarStartYellow()
            
            ProgressCompBarYellow()
                .offset(x: -5)
            
            ProgressCompBarYellow()
                .offset(x: -10)
            
            ProgressCompBarYellow()
                .offset(x: -15)
            
            ProgressCompBarEndYellow()
                .offset(x: -20)
            
        }
        
    }
    
}


struct ProgressCompBarStartYellow: View {
    
    var body: some View{
    
        ZStack {
    RoundedRectangle(cornerRadius: 10)
        .frame(width: 30, height: 15)
        .foregroundColor(Color("YellowCustom"))
    
    Rectangle()
        .frame(width: 10, height: 15)
        .foregroundColor(Color("YellowCustom"))
        .offset(x: 10)
        }
    }
}





struct ProgressCompBarStartBasic: View {
    
    var body: some View{
    
        ZStack {
    RoundedRectangle(cornerRadius: 10)
        .frame(width: 30, height: 15)
        .foregroundColor(Color("BaseColor"))
    
    Rectangle()
        .frame(width: 10, height: 15)
        .foregroundColor(Color("BaseColor"))
        .offset(x: 10)
        }
    }
}





struct ProgressCompBarYellow: View {
    
    var body: some View{
    
    Rectangle()
        .frame(width: 30, height: 15)
        .foregroundColor(Color("YellowCustom"))
    }
}





struct ProgressCompBarBasic: View {
    
    var body: some View{
    
    Rectangle()
        .frame(width: 30, height: 15)
        .foregroundColor(Color("BaseColor"))
    }
}





struct ProgressCompBarEndBasic: View {
    
    var body: some View{
    
        ZStack {
    RoundedRectangle(cornerRadius: 10)
        .frame(width: 30, height: 15)
        .foregroundColor(Color("BaseColor"))
    
    Rectangle()
        .frame(width: 10, height: 15)
        .foregroundColor(Color("BaseColor"))
        .offset(x: -10)
        }
    }
}





struct ProgressCompBarEndYellow: View {
    
    var body: some View{
    
        ZStack {
    RoundedRectangle(cornerRadius: 10)
        .frame(width: 30, height: 15)
        .foregroundColor(Color("YellowCustom"))
    
    Rectangle()
        .frame(width: 10, height: 15)
        .foregroundColor(Color("YellowCustom"))
        .offset(x: -10)
        }
    }
}







// STRUCTURE BLOCK AVIS


struct PostedReview: View {
    
    var body: some View{
        
        
        ZStack{
            
            
        
        RoundedRectangle(cornerRadius:30)
            .frame(width: 200, height: 100)
            .foregroundColor(.white)
            .shadow(radius: 5)
            .padding()
            
            HStack{
                
                Image("PicLaeticia")
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(25)
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                    .offset(x: -10)
                
                
                Text("Laeticia H")
                    .font(.system(size: 12))
                    .offset(x: -10, y: -10)
                
                
                // BLOCK NOTES
                
                ZStack{
                    
                    
                RoundedRectangle(cornerRadius: 7)
                    .frame(width: 37, height: 19)
                    .foregroundColor(Color("YellowCustom"))
                    .offset(x: 15, y: -5)
                    
                    HStack{
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 13))
                            .offset(x: 7, y: -1)
                        
                        Text("4.9")
                            .font(.system(size: 12))
                            .offset(x: -2)
                        
                    }.offset(x: 12, y: -5)
                    
                    
                }.offset(x: -7, y: -3)
                
                
                
                
            }.offset(y: -15)
            
            Text("Il y a  2 jours")
                .font(.system(size: 9))
                .foregroundColor(.gray)
                .offset(x: -10, y: -13)
            
            Text("Mathilde m'a aidé à réparer mon iPhone cassé en quelques minutes !")
                .frame(width: 180, height: 600)
                .font(.system(size: 10))
                .offset(x: 3, y: 17)
        }
    }
}










// VIEW


struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
