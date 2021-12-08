//
//  AppareilUser.swift
//  RepareMoi
//
//  Created by Apprenant 49 on 08/12/2021.
//

import SwiftUI



struct appareilview: View{
    //    var ima:UIImage = UIImage(contentsOfFile: "smar")!
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 22.0)
                .padding()
                .foregroundColor(.init(UIColor(red: 0.663, green: 0.843, blue: 0.867, alpha: 0.8)))
            
            HStack{
                Spacer()
                Image("smartphone_DefaultImage")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(0.4, contentMode: .fit)
                VStack{
                    Text("MacBook pro")
                        .bold()
                        .font(.caption)
                        .frame(width: 50)
                }
                Spacer()
            }
        }
    }
}

struct AppareilUser: View {
    @State private var numkwh:Int = 424
    
    
    let calculatorbackground:UIColor = UIColor(red: 0.663, green: 0.843, blue: 0.867, alpha: 0.8)
    var body: some View {
        VStack(alignment: .leading){
            Text("Mes Appareils")
                .font(.largeTitle)
                .bold()
                .padding()
            ZStack{
                Rectangle()
                    .foregroundColor(.init(calculatorbackground))
                    .frame(height: 80.0)
                
                Text("Mon empreinte : \(numkwh) g/kWh")
                    .font(.title)
                    .foregroundColor(.white)
                
            }
            Text("Cela représente un trajet en train Paris-Marseille")
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding(5)
            
            //DEBUT DU CODE POUR LE GRAND BOUTON D'APPAREIL
            ScrollView(){
                HStack{
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 22.0)
                            .padding()
                            .frame(height: 190.0)
                            .foregroundColor(.init(calculatorbackground))
                        
                        HStack{
                            Spacer()
                            Image("ordinateur_DefaultImage")
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(0.8, contentMode: .fit)
                            Spacer()
                            VStack{
                                Text("MacBook pro")
                                    .bold()
                                    .padding(1)
                                Text("apple M1, 13 pouce")
                            }
                            
                            Spacer()
                        }
                    }
                }
                //FIN DE L'APPAREIL MIS EN AVANS
                
                //DEBUT DU BOUTON DE GRILLE
                HStack(){
                    
                    appareilview()
                    appareilview()
                    
                    //FIN DU BOUTON DE GRILLE
                }
                
                Spacer()
            }
        }
    }
}

struct AppareilUser_Previews: PreviewProvider {
    static var previews: some View {
        AppareilUser()
    }
}
