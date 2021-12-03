//
//  ContentView.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 30/11/2021.
//

import SwiftUI

//La ContentView est la vue où l'on place la tabBar
struct ContentView: View {
    
    private var profil = profilTest
    private var appareilTest = profilTest.appareils[0]
    
    var body: some View {
        TabView() {
            MapUser()
                .tabItem({
                    VStack {
                        Image(systemName: "globe.asia.australia")
                        Text("Carte")
                    }
            })
            MapUser() //REMPLACER PAR LA BONNE VUE
                .tabItem({
                    VStack {
                        Image(systemName: "wrench.and.screwdriver")
                        Text("Mes Annonces")
                    }
            })
            MapUser() //REMPLACER PAR LA BONNE VUE
                .tabItem({
                    VStack {
                        Image(systemName: "ipad.and.iphone")
                        Text("Mes Appareils")
                    }
            })
            MapUser() //REMPLACER PAR LA BONNE VUE
                .tabItem({
                    VStack {
                        Image(systemName: "text.bubble")
                        Text("Messages")
                    }
            })
        }
    }
}
// test zz
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
