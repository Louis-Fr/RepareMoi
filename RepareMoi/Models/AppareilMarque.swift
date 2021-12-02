//
//  AppareilMarque.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 02/12/2021.
//

import Foundation

//Une classe servant d'enum de marques pour pouvoir les différencier dans le code.
class AppareilMarque : Codable {
    let marque: String
    
    fileprivate init(_ marque: String) {
        self.marque = marque
    }
}

class AppareilMarque_Smartphone : AppareilMarque {
    static let iPhone = AppareilMarque("iPhone")
    static let samsung = AppareilMarque("Samsung")
    static let huawei = AppareilMarque("Huawei")
    static let xiaomi = AppareilMarque("Xiaomi")
}

class AppareilMarque_Ordinateur : AppareilMarque {
    static let hp = AppareilMarque("HP")
    static let msi = AppareilMarque("MSI")
}

class AppareilMarque_Tablette : AppareilMarque {
    static let iPad = AppareilMarque("iPad")
}

class AppareilMarque_Montre : AppareilMarque {
    static let iWatch = AppareilMarque("iWatch")
}
