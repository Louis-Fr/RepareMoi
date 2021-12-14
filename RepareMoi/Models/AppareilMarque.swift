//
//  AppareilMarque.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 02/12/2021.
//

import Foundation

//Une classe servant d'enum de marques pour pouvoir les différencier dans le code.
class AppareilMarque : Codable, Identifiable {
    static func == (lhs: AppareilMarque, rhs: AppareilMarque) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    let marque: String
    let image: String
    
    fileprivate init(_ marque: String, _ image: String) {
        self.marque = marque
        self.image = image
    }
    
    static let empty = AppareilMarque("ERREUR", "")
    
    static func getMarqueFrom(string: String) -> AppareilMarque {
        for marque in AppareilMarque_Smartphone.casesMarque {
            if marque.marque == string {
                return marque
            }
        }
        for marque in AppareilMarque_Ordinateur.casesMarque {
            if marque.marque == string {
                return marque
            }
        }
        for marque in AppareilMarque_Tablette.casesMarque {
            if marque.marque == string {
                return marque
            }
        }
        for marque in AppareilMarque_Montre.casesMarque {
            if marque.marque == string {
                return marque
            }
        }
        
        return .empty
    }
}

class AppareilMarque_Smartphone : AppareilMarque {
    static let iPhone = AppareilMarque("Smartphone iPhone", "smartphone_DefaultImage")
    static let samsung = AppareilMarque("Smartphone Samsung", "smartphone_DefaultImage")
    static let huawei = AppareilMarque("Smartphone Huawei", "smartphone_DefaultImage")
    static let xiaomi = AppareilMarque("Smartphone Xiaomi", "smartphone_DefaultImage")
    
    static fileprivate let casesMarque = [iPhone, samsung, huawei, xiaomi]
    static let cases = [iPhone.marque, samsung.marque, huawei.marque, xiaomi.marque]
}

class AppareilMarque_Ordinateur : AppareilMarque {
    static let hp = AppareilMarque("Ordinateur HP", "ordinateur_DefaultImage")
    static let msi = AppareilMarque("Ordinateur MSI", "ordinateur_DefaultImage")
    
    static fileprivate let casesMarque = [hp, msi]
    static let cases = [hp.marque, msi.marque]
}

class AppareilMarque_Tablette : AppareilMarque {
    static let iPad = AppareilMarque("Tablette iPad", "smartphone_DefaultImage")
    
    static fileprivate let casesMarque = [iPad]
    static let cases = [iPad.marque]
}

class AppareilMarque_Montre : AppareilMarque {
    static let iWatch = AppareilMarque("Montre iWatch", "smartphone_DefaultImage")
    
    static fileprivate let casesMarque = [iWatch]
    static let cases = [iWatch.marque]
}
