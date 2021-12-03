//
//  ProfilView.swift
//  RepareMoi
//
//  Created by Odriste on 03/12/2021.
//

import SwiftUI

struct ProfilView: View {
    
    
    var body: some View {
       
            
        ScrollView(.vertical) {
            
            
            VStack{
                
                
                    Text("Ordinateur")
                        .frame(width: 150, height: 40)
                        .offset(y: 15)
                
                    ProgressCompBar1()
                    .padding(1)
                
                
                
                Text("Smartphone")
                    .frame(width: 150, height: 40)
                    .offset(y: 15)
                
                    ProgressCompBar2()
                    .padding(1)
                
                
                
                Text("Tablette")
                    .frame(width: 150, height: 40)
                    .offset(y: 15)
                
                    ProgressCompBar3()
                    .padding(1)
                
                
                
                Text("Watch")
                    .frame(width: 150, height: 40)
                    .offset(y: 15)
                
                    ProgressCompBar4()
                    .padding(1)
                
                
                
                Text("Autres")
                    .frame(width: 150, height: 40)
                    .offset(y: 15)
                
                    ProgressCompBar5()
                    .padding(1)
                
        
                }
            }
        }
    }









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




struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
