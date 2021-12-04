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
            
            ZStack {
                
                
                // FOND COULEUR
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("BaseColor"))
                    .frame(width: 500, height: 1000)
                
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.white)
                    .frame(width: 400, height: 600)
                    .offset(y: 100)
                
                // BOUTON RETOUR
            
            VStack{
                
                Text("\(Image(systemName: "arrow.left")) Retour")
                    .frame(width:100)
                    .offset(x: -140, y: -260)
                    .foregroundColor(Color("GrayCustom"))
                
            ZStack{
                
            // BLOCK COMPETENCES
                
                
                
                
                
            
            VStack{
                
                
                Text("Compétences")
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
                
                
                
            }.offset(x: -80, y: 240)
                
                
                    }
                }
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
