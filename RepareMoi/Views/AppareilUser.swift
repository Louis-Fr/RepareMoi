//
//  AppareilUser.swift
//  RepareMoi
//
//  Created by Apprenant 49 on 08/12/2021.
//

import SwiftUI

struct AppareilUser: View {
    @State private var numkwh:Int = 424
    //@State private var appareil:[Appareil] = appareils
    
    @State private var selection = false
    @State var sheetOpen: Bool = false
    
    @ObservedObject var profil: Profil
    
    @State private var first: Appareil
    @State private var othersAppareils: [Appareil]
    
    @State var hasChanged: Bool = false
    
    init(profil: Profil) {
        self.profil = profil
        var array = profil.appareils
        
        self._first = State(initialValue: array.removeFirst())
        self._othersAppareils = State(initialValue: array)
        
        var result = 0.0
        
        for appareil in profil.appareils {
            result += appareil.calculerEmpreinte()
        }
        
        self._numkwh = State(initialValue: Int(result))
    }
    
    let gridmodal = [
        GridItem(), GridItem()
    ]
    
    let calculatorbackground:UIColor = UIColor(red: 0.663, green: 0.843, blue: 0.867, alpha: 0.8)
    var body: some View {
        NavigationView {
            
            ScrollView {
                
                VStack(alignment: .leading){
                    
                    ZStack{
                        Rectangle()
                            .foregroundColor(.init(calculatorbackground))
                            .frame(height: 100.0)
                        
                        VStack {
                            Text("L'empreinte de mes appareils")
                                .bold()
                                .font(.title2)
                                .padding(2)
                                //.frame(width: 50, height: 50, alignment: .leading)
                                 Text(" 🌎  \(numkwh)  g / kWh")
                                .font(.title)
                                .foregroundColor(Color.blue)
                            .shadow(radius: 5)
                        }
                        
                            //.foregroundColor(.white)
                        
                    }
                    
                    Text("Cela représente un trajet Paris -> Lyon en voiture 🚘")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .shadow(radius: 1)
                    
                    //DEBUT DU CODE POUR LE GRAND BOUTON D'APPAREIL
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 22.0)
                                .padding(.horizontal, 20.0)
                                .frame(height: 190.0)
                                .foregroundColor(.init(calculatorbackground))
                            
                            HStack{
                                Spacer()
                                Image(first.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150)
                                Spacer()
                                VStack{
                                    Text(first.marqueAppareil.marque)
                                        .bold()
                                        .padding(1)
                                    Text(first.marqueAppareil.marque)
                                }
                                
                                Spacer()
                            }
                        }
                    }
                    //FIN DE L'APPAREIL MIS EN AVANS
                    
                    //DEBUT DU BOUTON DE GRILLE
                    //                HStack(){
                    LazyVGrid(columns: gridmodal, content: {
                        ForEach(othersAppareils){bordel in
                            AppareilView(imageName: bordel.image, deviceName: bordel.marqueAppareil.marque)
                        }
                        ZStack{
                            RoundedRectangle(cornerRadius: 22.0)
                                .foregroundColor(.init(UIColor(red: 0.663, green: 0.843, blue: 0.867, alpha: 0.5)))
                            HStack(spacing: 0){
                                
                                Spacer()
                                //NavigationLink(destination: addAppareil(isOpen: $sheetOpen,profil:profil), isActive: $selection) {
                                    
                                    Image(systemName: "plus.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(idealWidth: 50, maxWidth: 50, minHeight: 50, idealHeight: 50, maxHeight: 50)
                                    
                               // } // Fin NavLink
                                
                                Spacer()
                            }
                            .onTapGesture {
                                sheetOpen.toggle()
                            }
                            .sheet(isPresented: $sheetOpen, onDismiss: {}) {
                                addAppareil(isOpen: $sheetOpen, changeValue: $hasChanged, profil:profil)
                            }
                            
                            
                        }.padding(.horizontal, 15.0)
                            .frame(minWidth: 200, idealWidth: 200, maxWidth: 200, minHeight: 200, idealHeight: 200, maxHeight: 200, alignment: .center)
                        
                        
                    }).padding(.horizontal, 20.0)
                    
                    
                    //FIN DU BOUTON DE GRILLE
                    //                }
                    
                    Spacer()
                }
            }
            .navigationTitle("Mes Appareils").navigationBarTitleDisplayMode(.inline)
        } // Fin ScrollView
        .onChange(of: hasChanged, perform: { newValue in
                print("TEST : ", profil)
                var array = profil.appareils
                first = array.removeFirst()
                othersAppareils = array
                
                var result = 0.0
                
                for appareil in profil.appareils {
                    result += appareil.calculerEmpreinte()
                }
                
                self.numkwh = Int(result)
        })
    } // Fin NavigationView
}

struct AppareilUser_Previews: PreviewProvider {
    static var previews: some View {
        AppareilUser(profil: profilTest)
    }
}
