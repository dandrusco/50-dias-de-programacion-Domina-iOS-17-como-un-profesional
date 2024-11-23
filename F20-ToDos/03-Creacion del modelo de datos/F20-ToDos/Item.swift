//
//  Item.swift
//  F20-ToDos
//
//  Created by Danilo Andrusco on 23-11-24.
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
