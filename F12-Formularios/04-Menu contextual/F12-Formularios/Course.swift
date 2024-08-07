//
//  Course.swift
//  F09-Listas
//
//  Created by Danilo Andrusco on 13-02-24.
//

import Foundation

struct Course: Identifiable{
    var id = UUID()
    var name: String
    var image: String
    var author: String
    var difficulty: Int
    var description: String
    var price: Float
    var isFavorite: Bool = false
    var isPurchased: Bool = false
}
