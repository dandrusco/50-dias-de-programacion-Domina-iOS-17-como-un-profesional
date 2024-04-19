//
//  SettingFactory.swift
//  F12-Formularios
//
//  Created by Danilo Andrusco on 10-04-24.
//

import Foundation
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
    //1. Ahora es el turno de ordenar ya sea por alfabeticamente, favorito o comprado, para ello crearemos  un predicado que no es mas que un clouser que requiere entradas (dos cursos) en formato de tupla y que devolvera un valor booleano
    func sortPredicate() -> ((Course, Course) -> Bool){
        switch self {
            //1. En alfabetica devolvemos el nombre que sea menor que el que siga para ir ordenandolo de menos a mayor
        case .alphabetical:
            return {$0.name < $1.name}
            //2. En los favoritos ordenamos primero los que estan marcados como favorito
        case .favorite:
            return {$0.isFavorite && !$1.isFavorite}
            //3. Lo mismo para los comprados, primero mostramos los que se han comprado
        case .purchased:
            return {$0.isPurchased && !$1.isPurchased}
        }
    }
}

final class SettingsFactory: ObservableObject {
    init(){
        UserDefaults.standard.register(defaults: [
            "app.settings.displayOrder" : 0,
            "app.settings.showPurchasedOnly" : false,
            "app.settings.showFavouriteOnly" : false,
            "app.settings.maxDifficultyLevel" : 4,
            "app.settings.minPriceShow" : 0,
            "app.settings.maxPriceShow" : 50
        ])
    }
    
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
    
    @Published var showFavouriteOnly : Bool = UserDefaults.standard.bool(forKey: "app.settings.showFavouriteOnly") {
        didSet{
            UserDefaults.standard.set(showFavouriteOnly, forKey: "app.settings.showFavouriteOnly")
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
}
