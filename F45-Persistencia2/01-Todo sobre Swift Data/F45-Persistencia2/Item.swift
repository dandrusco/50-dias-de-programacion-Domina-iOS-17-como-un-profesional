//
//  Item.swift
//  F45-Persistencia2
//
//  Created by Danilo Andrusco on 31-01-25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
