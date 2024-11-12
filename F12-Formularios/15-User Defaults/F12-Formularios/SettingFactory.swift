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


//3. Declararemos una clase final (que no cambiara) llamada SettingsFactory que sera la encargada de almacenar las preferencias del usuario
final class SettingsFactory {
    //4. Creamos el inicializador (constructor)
    init(){
        //5. Accederemos a las UserDefaults que nos proporciona el mismo sistema, luego accedemos a las preferencias estandar y sobre esta vamos a registrar una serie de preferencias, que sera un diccionario con sus valores por defecto
        UserDefaults.standard.register(defaults: [
            "app.settings.displayOrder" : 0,
            "app.settings.showPurchasedOnly" : false,
            "app.settings.showfavorite" : false,
            "app.settings.maxDifficultyLevel" : 4,
            "app.settings.minPriceShow" : 0,
            "app.settings.maxPriceShow" : 50
        ])
    }
    
    //6. Para cada una de estas 6 variables que hemos creado, necesitamos crear una variable accesible a traves de las SettingsFactory que consulte el valor en la BBDD para poder devolverlo
    //7. Partiremos con la primera variable que llamaremos displayOrder que es un numero entero, esta variable sera igual al valor que del UserDefaults.standar determine a partir del integer (valor entero) para la clave "app.settings.displayOrder". Como el usuario puede ir cambiando este valor deberemos meter un didSet entre {} para poder registrar cuando alguien cambie el valor de la variable displayOrder, automaticamente ese cambio se registre tambien en la BBDD de UserDefaults.standard
    var displayOrder : Int = UserDefaults.standard.integer(forKey: "app.settings.displayOrder") {
        didSet{
            //8. Aqui lo registramos en UserDefaults.standar y con set registraremos el valor que tenga ahora la variable displayOrder con la clave "app.settings.displayOrder"
            UserDefaults.standard.set(displayOrder, forKey: "app.settings.displayOrder")
        }
    }
    
    //9. Ahora trabajaremos para la segunda variable de tipo boolena
    var showPurchasedOnly : Bool = UserDefaults.standard.bool(forKey: "app.settings.showPurchasedOnly") {
        didSet{
            UserDefaults.standard.set(showPurchasedOnly, forKey: "app.settings.showPurchasedOnly")
        }
    }
}
