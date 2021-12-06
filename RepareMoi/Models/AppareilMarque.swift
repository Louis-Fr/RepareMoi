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
    static let iPhone = AppareilMarque("Smartphone iPhone")
    static let samsung = AppareilMarque("Smartphone Samsung")
    static let huawei = AppareilMarque("Smartphone Huawei")
    static let xiaomi = AppareilMarque("Smartphone Xiaomi")
}

class AppareilMarque_Ordinateur : AppareilMarque {
    static let hp = AppareilMarque("Ordinateur HP")
    static let msi = AppareilMarque("Ordinateur MSI")
}

class AppareilMarque_Tablette : AppareilMarque {
    static let iPad = AppareilMarque("Tablette iPad")
}

class AppareilMarque_Montre : AppareilMarque {
    static let iWatch = AppareilMarque("Montre iWatch")
}
