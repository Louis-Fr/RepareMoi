//
//  Empreinte.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 02/12/2021.
//

import Foundation

struct Empreinte {
    //Empreinte écologique de la fabrication de l'appareil, en kg CO2
    let fabricationEnpreinte: Double
    //Consommation de l'appareil en KiloWattsHeure
    let kWh: Double
    
    private static let empreinteParKWh = 0.065
    
    func calculerEmpreinteMax(anneeUse: Int) -> Double {
        return fabricationEnpreinte + (Double(anneeUse)*8760)*kWh*Empreinte.empreinteParKWh
    }
    
    func calculerEmpreinteMoyenne(anneeUse: Int) -> Double {
        return fabricationEnpreinte + (Double(anneeUse)*(365.25*5))*kWh*Empreinte.empreinteParKWh
    }
    
    func calculerEmpreinteMin() -> Double {
        return fabricationEnpreinte
    }
}

//Liste d'appareils enregistrés de base dans l'appli - A VOIR POUR AJOUTER D'AUTRES CHOSES
extension Empreinte {
    static let iphone8 = Empreinte(fabricationEnpreinte: 47.31, kWh: 1)
    static let iphone8Plus = Empreinte(fabricationEnpreinte: 55.76, kWh: 1)
    static let iphoneX = Empreinte(fabricationEnpreinte: 64.78, kWh: 1)
}
