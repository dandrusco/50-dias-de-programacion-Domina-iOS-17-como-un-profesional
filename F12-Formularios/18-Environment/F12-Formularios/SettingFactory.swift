//
//  SettingFactory.swift
//  F12-Formularios
//
//  Created by Danilo Andrusco on 10-04-24.
//

import Foundation
//2. Para ello deberemos importar un Famework llamado Combine
import Combine

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

//1. Para que cada vez que usuario realice cambios en los ajustes, y estos se reflejen en tiempo real deberemos hacerle unos cambios a la SettingsFactory
//3. Ahora la SettingsFactory debera adoptar este protocolo ObservableObject de Combine
final class SettingsFactory: ObservableObject {
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
    
    //4. Ahora en todas las propiedades que tenemos declaradas deberemos anteponer el @Published que es lo que hace que todo el mundo podra leer y consultar
    @Published var displayOrder : Int = UserDefaults.standard.integer(forKey: "app.settings.displayOrder") {
        didSet{
            UserDefaults.standard.set(displayOrder, forKey: "app.settings.displayOrder")
        }
    }
    
    @Published var showPurchasedOnly : Bool = UserDefaults.standard.bool(forKey: "app.settings.showPurchasedOnly") {
        didSet{
            UserDefaults.standard.set(showPurchasedOnly, forKey: "app.settings.showPurchasedOnly")
        }
    }
    
    @Published var showfavorite : Bool = UserDefaults.standard.bool(forKey: "app.settings.showfavorite") {
        didSet{
            UserDefaults.standard.set(showfavorite, forKey: "app.settings.showfavorite")
        }
    }
    
    @Published var maxDifficultyLevel : Int = UserDefaults.standard.integer(forKey: "app.settings.maxDifficultyLevel") {
        didSet{
            UserDefaults.standard.set(maxDifficultyLevel, forKey: "app.settings.maxDifficultyLevel")
        }
    }
    
    @Published var minPriceShow : Float = UserDefaults.standard.float(forKey: "app.settings.minPriceShow") {
        didSet{
            UserDefaults.standard.set(minPriceShow, forKey: "app.settings.minPriceShow")
        }
    }
    
    @Published var maxPriceShow : Float = UserDefaults.standard.float(forKey: "app.settings.maxPriceShow") {
        didSet{
            UserDefaults.standard.set(maxPriceShow, forKey: "app.settings.maxPriceShow")
        }
    }
    //5. Ahora deberemos modificar las SettingView
}
