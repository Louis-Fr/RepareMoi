//
//  ProfilView.swift
//  RepareMoi
//
//  Created by Odriste on 03/12/2021.
//

import SwiftUI

struct ProfilView: View {
    
    
    var body: some View {
       
        NavigationView {
            
        ScrollView(.vertical) {
            
            VStack{
                
                
                Text("Ordinateurs")
                    .offset(x: -100)
                
            
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
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}








// STRUCTURES VISUELLES POUR BARRE COMPETENCES









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
