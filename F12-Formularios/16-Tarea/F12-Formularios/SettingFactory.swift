//
//  SettingFactory.swift
//  F12-Formularios
//
//  Created by Danilo Andrusco on 10-04-24.
//

import Foundation

enum DisplayOrder: Int, CaseIterable {
    case alphabetical = 0
    case favorite = 1
    case purchased = 2 
    
    init(type: Int) {
        switch type {
        case 0:
            self = .alphabetical
        case 1:
            self = .favorite
        case 2:
            self = .purchased
        default:
            self = .alphabetical
        }
    }
    
    var text: String {
        switch self {
        case .alphabetical:
            return "Orden Alfabetio"
        case .favorite:
            return "Primero los Favoritos"
        case .purchased:
            return "Primero los Comprados"
        }
    }
}


final class SettingsFactory {
    init(){
        UserDefaults.standard.register(defaults: [
            "app.settings.displayOrder" : 0,
            "app.settings.showPurchasedOnly" : false,
            "app.settings.showfavorite" : false,
            "app.settings.maxDifficultyLevel" : 4,
            "app.settings.minPriceShow" : 0,
            "app.settings.maxPriceShow" : 50
        ])
    }
    
    var displayOrder : Int = UserDefaults.standard.integer(forKey: "app.settings.displayOrder") {
        didSet{
            UserDefaults.standard.set(displayOrder, forKey: "app.settings.displayOrder")
        }
    }
    
    var showPurchasedOnly : Bool = UserDefaults.standard.bool(forKey: "app.settings.showPurchasedOnly") {
        didSet{
            UserDefaults.standard.set(showPurchasedOnly, forKey: "app.settings.showPurchasedOnly")
        }
    }
    
    //TODO: Tarea, programar las otras 4 variables:
    var showfavorite : Bool = UserDefaults.standard.bool(forKey: "app.settings.showfavorite") {
        didSet{
            UserDefaults.standard.set(showfavorite, forKey: "app.settings.showfavorite")
        }
    }
    
    var maxDifficultyLevel : Int = UserDefaults.standard.integer(forKey: "app.settings.maxDifficultyLevel") {
        didSet{
            UserDefaults.standard.set(maxDifficultyLevel, forKey: "app.settings.maxDifficultyLevel")
        }
    }
    
    //1. Estas sera de tipo Float
    var minPriceShow : Float = UserDefaults.standard.float(forKey: "app.settings.minPriceShow") {
        didSet{
            UserDefaults.standard.set(minPriceShow, forKey: "app.settings.minPriceShow")
        }
    }
    
    var maxPriceShow : Float = UserDefaults.standard.float(forKey: "app.settings.maxPriceShow") {
        didSet{
            UserDefaults.standard.set(maxPriceShow, forKey: "app.settings.maxPriceShow")
        }
    }
    
    //2. Con esto damos por finalizado las SettingFactory, ahora nos iremos a la SettingView para implementar el guardado de dato
    
}
