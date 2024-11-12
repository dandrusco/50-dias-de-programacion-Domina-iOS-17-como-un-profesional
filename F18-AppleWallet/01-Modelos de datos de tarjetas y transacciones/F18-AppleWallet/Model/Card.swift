//
//  Card.swift
//  F18-AppleWallet
//
//  Created by Danilo Andrusco on 12-11-24.
//

import Foundation

//11. Definiremos su estructura identificable
struct Card: Identifiable {
    //12. Necesitaremos un identificador unico
    var id = UUID()
    //12. Necesitaremos el nombre de la tarjeta
    var name: String
    //12. Necesitamos el tipo de tarjeta
    var type : CardType
    //14. Numero de tarjeta
    var number: String
    //15. Fecha de expiracion
    var expirationDate: String
    //16. necesitamos la imagen
    var image: String {
        //17. Como el nombre de la tarjeta coincide con el nombre del fichero de la imagen realizaremos un return con el valor en curdo obtenido del enumerado
        return type.rawValue
    }
}

//13. Crearemos un enumerado para el tipo de tarjeta que sea de tipo string para que envez de guardar 0,1... nos guarde visa, mastercard....
enum CardType: String{
    case visa
    case mastercard
    case amex
    case chase
    case discover
}

//18. Crearemos las tarjetas de prueba:
#if DEBUG

var cards = [
    Card(name: "Danilo Andrusco", type: .visa, number: "1234 5678 9123 4567", expirationDate: "09/26"),
    Card(name: "Patricia Tapia", type: .amex, number: "4564 5678 8524 4567", expirationDate: "09/25"),
    Card(name: "Sophia Andrusco", type: .chase, number: "9878 2354 9258 9632", expirationDate: "05/26"),
    Card(name: "Mila Andrusco", type: .discover, number: "5553 1234 5687 8526", expirationDate: "12/27"),
    Card(name: "Bruno Andrusco", type: .mastercard, number: "9634 8855 7461 3719", expirationDate: "12/24")
]
#endif

//19 Creamreos una carpeta llamada Model y meteremos tanto la transaction como la card
//20 Tambien crearemnos otra carpeta llamada View y meteremos las vistas, como la ContentView y asi nos queda mas ordenado 
