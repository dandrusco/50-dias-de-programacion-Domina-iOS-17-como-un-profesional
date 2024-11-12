//
//  Transaction.swift
//  F18-AppleWallet
//
//  Created by Danilo Andrusco on 12-11-24.
//

import Foundation

//2. Definiremos su estructura identificable
struct Transaction: Identifiable {
    //3. Necesitaremos un identificador unico
    var id: UUID
    //4. Necesitaremos un vendedor
    var merchant: String
    //5. Necesitamos la cantidad
    var amount : Double
    //6. la fecha
    var date: String
    //7. Un icono
    var icon: String = "dollarsing.circle"
}

//8. Pondremos el debug
#if DEBUG
var transactions = [
    //9. Genereamos una cuuantas de prueba
    Transaction(id: UUID(), merchant: "Amazon", amount: 65, date: "12-11-24", icon: "cart.circle"),
    Transaction(id: UUID(), merchant: "Apple", amount: 30, date: "10-12-24", icon: "apple.logo"),
    Transaction(id: UUID(), merchant: "Netflix", amount: 20, date: "15-01-24", icon: "movieclapper.fill"),
    Transaction(id: UUID(), merchant: "Microsoft", amount: 35, date: "12-04-24", icon: "takeoutbag.and.cup.and.straw.fill"),
    Transaction(id: UUID(), merchant: "Disney", amount: 30, date: "25-07-24", icon: "cup.and.saucer.fill")
]
#endif

//10. Crearemos otro fichero para las tarrjetas de creditos 
