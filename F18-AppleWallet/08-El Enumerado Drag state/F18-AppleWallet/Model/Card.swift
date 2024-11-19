//
//  Card.swift
//  F18-AppleWallet
//
//  Created by Danilo Andrusco on 12-11-24.
//

import Foundation

struct Card: Identifiable {
    var id = UUID()
    var name: String
    var type : CardType
    var number: String
    var expirationDate: String
    var image: String {
        return type.rawValue
    }
}

enum CardType: String{
    case visa
    case mastercard
    case amex
    case chase
    case discover
}

#if DEBUG

var cards = [
    Card(name: "Danilo Andrusco", type: .visa, number: "1234 5678 9123 4567", expirationDate: "09/26"),
    Card(name: "Patricia Tapia", type: .amex, number: "4564 5678 8524 4567", expirationDate: "09/25"),
    Card(name: "Sophia Andrusco", type: .chase, number: "9878 2354 9258 9632", expirationDate: "05/26"),
    Card(name: "Mila Andrusco", type: .discover, number: "5553 1234 5687 8526", expirationDate: "12/27"),
    Card(name: "Bruno Andrusco", type: .mastercard, number: "9634 8855 7461 3719", expirationDate: "12/24")
]
#endif
