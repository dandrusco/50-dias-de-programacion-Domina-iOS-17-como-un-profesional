//
//  SettingFactory.swift
//  F12-Formularios
//
//  Created by Danilo Andrusco on 10-04-24.
//

import Foundation


//2. Crearemos un enumerado llamado DisplayOrder, que esta asociado a un tipo de clave entera y CaseIterable que nos permitira obtener una coleccion de dato iterable
enum DisplayOrder: Int, CaseIterable {
    //3. Crearemos nuestro 3 tipos de datos
    case alphabetical = 0
    case favorite = 1
    case purchased = 2 
    
    //4. Ahora contruiremos un contructor que tomara por tipo de orden numerico entero
    init(type: Int) {
        //5. crearemos un switch del tipo
        switch type {
        //6. En el caso que sea del tipo 0
        case 0:
            //7. Self tomara el valor de tipo alphabetical
            self = .alphabetical
        //8. En el caso de 1 sera favorite
        case 1:
            self = .favorite
        //9. Para el 2 sera purchased
        case 2:
            self = .purchased
        //10. Si o si deberemos poner un por defecto
        default:
            self = .alphabetical
        }
    }
    
    //11. Ahora necesitaremos una variable para la version String de este enumerado
    var text: String {
        //12. Crearemos un switch de self, del valor que tengamos asignado
        switch self {
        //13. En vez de tomar el valor 0, 1, 2... lo hacemos directamente con la clave
        case .alphabetical:
            return "Orden Alfabetio"
        case .favorite:
            return "Primero los Favoritos"
        case .purchased:
            return "Primero los Comprados"
        //14 Como es exaustivo no debemos poner un default
            
        //15. Ahora nos iremos a la SettingView para reflejar estos cambios 
        }
    }
}
