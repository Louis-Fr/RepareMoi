//
//  test  avis.swift
//  RepareMoi
//
//  Created by Odriste on 05/12/2021.
//

import SwiftUI

struct test__avis: View {
    var body: some View {
        
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

struct test__avis_Previews: PreviewProvider {
    static var previews: some View {
        test__avis()
    }
}
