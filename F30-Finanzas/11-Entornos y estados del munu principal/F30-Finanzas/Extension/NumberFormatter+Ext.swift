//
//  NumberFormatter+Ext.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 19-12-24.
//


import Foundation

extension NumberFormatter{
    static func currency(from value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        let formattedValue = formatter.string(from: NSNumber(value: value)) ?? "0.00"
        
        return "USD " + formattedValue
    }
}
