//
//  Transaction.swift
//  F18-AppleWallet
//
//  Created by Danilo Andrusco on 12-11-24.
//

import Foundation

struct Transaction: Identifiable {
    var id: UUID
    var merchant: String
    var amount : Double
    var date: String
    var icon: String = "dollarsing.circle"
}

#if DEBUG
var transactions = [
    Transaction(id: UUID(), merchant: "Amazon", amount: 65, date: "12-11-24", icon: "cart.circle"),
    Transaction(id: UUID(), merchant: "Apple", amount: 30, date: "10-12-24", icon: "apple.logo"),
    Transaction(id: UUID(), merchant: "Netflix", amount: 20, date: "15-01-24", icon: "movieclapper.fill"),
    Transaction(id: UUID(), merchant: "Microsoft", amount: 35, date: "12-04-24", icon: "window.ceiling.closed"),
    Transaction(id: UUID(), merchant: "Disney", amount: 30, date: "25-07-24", icon: "popcorn.fill")
]
#endif
