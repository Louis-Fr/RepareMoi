//
//  AppareilView.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 13/12/2021.
//

import SwiftUI

struct AppareilView: View{
    //    var ima:UIImage = UIImage(contentsOfFile: "smar")!
    let cellsize:CGFloat = 200
    
    let imageName:String
    let deviceName:String
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 22.0)
                .foregroundColor(.init(UIColor(red: 0.663, green: 0.843, blue: 0.867, alpha: 0.8)))
            //                .shadow(color: .init(UIColor(red: 0.663, green: 0.843, blue: 0.867, alpha: 1)), radius: 10.4, x: 0, y: 0)
            HStack(spacing: 0){
                
                Spacer()
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(idealWidth: 50, maxWidth: 100, minHeight: 50, idealHeight: 100, maxHeight: 130)
                VStack{
                    Text(deviceName)
                        .bold()
                        .font(.caption)
                    
                }
                Spacer()
            }
            
            
        }.padding(.horizontal, 15.0)
            .frame(minWidth: cellsize, idealWidth: cellsize, maxWidth: cellsize, minHeight: cellsize, idealHeight: cellsize, maxHeight: cellsize, alignment: .center)
    }
}

struct AppareilView_Previews: PreviewProvider {
    static var previews: some View {
        AppareilView(imageName: "ordinateur_DefaultImage", deviceName: "TEST")
    }
}
