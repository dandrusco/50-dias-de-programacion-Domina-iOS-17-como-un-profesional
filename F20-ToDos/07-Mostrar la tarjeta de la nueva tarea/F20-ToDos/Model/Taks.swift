//
//  Taks.swift
//  F20-ToDos
//
//  Created by Danilo Andrusco on 23-11-24.
//

//
import Foundation
import SwiftUI
import SwiftData

enum Priority: Int {
    case low = 1
    case normal = 2
    case high = 3
    
    func toString() -> String{
        switch self {
        case .low:
            return "Baja"
        case .normal:
            return "Normal"
        case .high:
            return "Alta"
        }
    }
    
    func color() -> Color{
        switch self{
        case .low:
            return .green
        case .normal:
            return .orange
        case .high:
            return .red
        }
    }
}

@Observable class Task: Identifiable{
    var id : UUID
    var title:String
    var priority: Priority
    var isCompleted : Bool
    
    init(id: UUID = UUID(), title: String = "", priority: Priority = .normal, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.priority = priority
        self.priority = priority
    }
}