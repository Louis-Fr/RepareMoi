//
//  ProfilView.swift
//  RepareMoi
//
//  Created by Audrey on 03/12/2021.
//

import SwiftUI



struct ProfileAlbert: View {
    
    // BOUTON RETOUR CUSTOM
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

        var btnBack : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                Image(systemName: "arrow.left")
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
                    .frame(width: 500, height: 1200)
        
                
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
                
                Image("Obama")
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(25)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .offset(y: -360)
                
                Text("Albert Dupont")
                    .font(.system(size: 25))
                    .bold()
                    .offset(y: -260)
                
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
                        
                    }).offset(y: -215)
                
               
            
                
                
            // BLOCK DESCRIPTION
                
                VStack {
            
                Text("**Description**")
                        .font(.system(size: 25))
                        .offset(x: -109, y: -38)
                        
                    
                Text("Bonjour, je suis un ancien réparateur à la retraite. Je serais ravi de vous aider à réparer vos appareils.")
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
                        
                    Text("4.3/5")
                            .offset(x: -90)
                        
                        Text("(8)")
                            .foregroundColor(.gray)
                            .offset(x: -90)
                    
                    }.offset(x: 20, y: 285)
                    
                    
                    // STRUCTURES A FAIRE POUR + DE LISIBILITE & FONCTIONNALITE
                    
                    ScrollView(.horizontal){
                        
                    HStack{
                        
                        
                    PostedReviewMohamedforAlbert()
                        
                        
                    PostedReviewMathilde()
                    
                        
                    PostedReviewLaeticiaforAlbert()
                    
                        
                        
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
                
                    ProgressCompBar4()
                        .offset(y: -20)
                
            
                
                
                Text("Smartphones")
                    .frame(width: 150, height: 40)
                    .offset(x: -38, y: -30)
                
                ProgressCompBar5()
                    .offset(y: -45)
                    
                
                
                
                Text("Tablettes")
                    .frame(width: 150, height: 40)
                    .offset(x: -55, y: -55)
                
                ProgressCompBar3()
                    .offset(y: -70)
                  
                
                
                
                Text("Autres")
                    .frame(width: 150, height: 40)
                    .offset(x: -65, y: -80)
                
                ProgressCompBar2()
                    .offset(y: -95)
                
                
                
                
            }.offset(x: -80, y: 275)
            // FIN VSTACK
                
                
               
                
                
            } // FIN ZSTACK
            
            
        }.navigationBarBackButtonHidden(true)
         .navigationBarItems(leading: btnBack)
         // FIN NAVIGATIONVIEW
        
    } // FIN BODY
    
} // FIN STRUCT





struct PostedReviewMathilde: View {
    
    var body: some View{
        
        
        ZStack{
            
            
        
        RoundedRectangle(cornerRadius:30)
            .frame(width: 200, height: 100)
            .foregroundColor(.white)
            .shadow(radius: 5)
            .padding()
            
            HStack{
                
                Image("imagepickerProfil")
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(25)
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                    .offset(x: -10)
                
                
                Text("Mathilde G")
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
                        
                        Text("4.3")
                            .font(.system(size: 12))
                            .offset(x: -2)
                        
                    }.offset(x: 12, y: -5)
                    
                    
                }.offset(x: -7, y: -3)
                
                
                
                
            }.offset(y: -15)
            
            Text("Il y a  22 heures")
                .font(.system(size: 9))
                .foregroundColor(.gray)
                .offset(x: -8, y: -13)
            
            Text("Albert m'a réparé mon ordinateur en 2 minutes ! Réparateur très rapide.")
                .frame(width: 180, height: 600)
                .font(.system(size: 10))
                .offset(x: 2, y: 20)
        }
    }
}



struct PostedReviewMohamedforAlbert: View {
    
    var body: some View{
        
        
        ZStack{
            
            
        
        RoundedRectangle(cornerRadius:30)
            .frame(width: 200, height: 100)
            .foregroundColor(.white)
            .shadow(radius: 5)
            .padding()
            
            HStack{
                
                Image("ben-parker")
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(25)
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                    .offset(x: -10)
                
                
                Text("Mohamed")
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
                        
                        Text("5.0")
                            .font(.system(size: 12))
                            .offset(x: -2)
                        
                    }.offset(x: 12, y: -5)
                    
                    
                }.offset(x: -7, y: -3)
                
                
                
                
            }.offset(y: -15)
            
            Text("Il y a  4 heures")
                .font(.system(size: 9))
                .foregroundColor(.gray)
                .offset(x: -8, y: -13)
            
            Text("Un réparateur très aimable, je recommande !")
                .frame(width: 180, height: 600)
                .font(.system(size: 10))
                .offset(x: -5, y: 17)
        }
    }
}






struct PostedReviewLaeticiaforAlbert: View {
    
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
            
            Text("Albert m'a aidé à réparer mon iPhone cassé en quelques minutes !")
                .frame(width: 180, height: 600)
                .font(.system(size: 10))
                .offset(x: 3, y: 17)
        }
    }
}


// VIEW


struct ProfileAlbert_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAlbert()
    }
}
