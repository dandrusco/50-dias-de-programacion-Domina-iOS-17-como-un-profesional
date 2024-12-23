//
//  Item.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 19-12-24.
//

import Foundation
import SwiftData

enum PaymentCategory: Int{
    case income = 0 // Ingresos
    case expense = 1 // Gastos
}

@Model class PaymentRecord {
    @Attribute(.unique) var paymentID: UUID
    var date: Date // Fecha
    var name: String // Nombre de la transaccion
    var location: String? // La localidad donde hemos realizado la transaccion por ejemplo Frogames
    var amount: Double // La cantidad de la transaccion
    var notes: String? // Observacion adicional

    @Transient var type: PaymentCategory {
        get {
            PaymentCategory(rawValue: Int(self.typeNum)) ?? .expense
        }
        set{
            self.typeNum = Int(newValue.rawValue)
        }
    }
    
    @Attribute(originalName: "type") var typeNum: PaymentCategory.RawValue
    
    init(paymentID: UUID = UUID(), date: Date, name: String, location: String? = nil, amount: Double, notes: String? = nil, type: PaymentCategory) {
        self.paymentID = paymentID
        self.date = date
        self.name = name
        self.location = location
        self.amount = amount
        self.notes = notes
        self.typeNum = Int(type.rawValue)
        self.type = type
    }
}
