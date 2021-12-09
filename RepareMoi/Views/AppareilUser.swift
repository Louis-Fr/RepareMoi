//
//  AppareilUser.swift
//  RepareMoi
//
//  Created by Apprenant 49 on 08/12/2021.
//

import SwiftUI



struct appareilview: View{
    //    var ima:UIImage = UIImage(contentsOfFile: "smar")!
    let cellsize:CGFloat = 200
    
    let imageName:String = "smartphone_DefaultImage"
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 22.0)
                .foregroundColor(.init(UIColor(red: 0.663, green: 0.843, blue: 0.867, alpha: 0.8)))
            HStack{
                
                Spacer()
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(idealWidth: 50, maxWidth: 100, minHeight: 50, idealHeight: 100, maxHeight: 140)
                VStack{
                    Text("MacBook pro")
                        .bold()
                        .font(.caption)
                        
                }
                Spacer()
            }
               
            
        }.padding()
        .frame(minWidth: cellsize, idealWidth: cellsize, maxWidth: cellsize, minHeight: cellsize, idealHeight: cellsize, maxHeight: cellsize, alignment: .center)
    }
}

struct AppareilUser: View {
    @State private var numkwh:Int = 424
    let gridmodal = [
        GridItem(), GridItem()
    ]
    
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
                                .frame(width: 150)
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
//                HStack(){
                LazyVGrid(columns: gridmodal, content: {
                    appareilview()
                    appareilview()
                    appareilview()
                    appareilview()
                    appareilview()
                    appareilview()
                    
                }).padding(15)
                    
                    
                    //FIN DU BOUTON DE GRILLE
//                }
                
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
