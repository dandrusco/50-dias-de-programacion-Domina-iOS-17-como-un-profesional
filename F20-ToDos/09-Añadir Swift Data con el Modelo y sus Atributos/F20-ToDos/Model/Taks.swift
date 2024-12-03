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

//1. La clase Observable deberemos cambiarla a Model, que convierte un modelo almacenado y manejado por SwiftData
@Model class Task: Identifiable{
    var id : UUID
    var title:String
    //2. Debemos modificar la prioridad, ya que deberemos almacenar su valor en crudo
    /*var priority: Priority*/
    @Transient var priority: Priority{
        //3. Cuando consutemos el valor de la prioridad
        get {
            //4. devolvemos un valor en crudo que sea Int del priorityNum que generaremos, de lo contrario sera normal
            return Priority(rawValue: Int(self.priorityNum)) ?? .normal
        }
        //5. Lo mismo para el seter
        set {
            //6. Le asignamos al priorityNum el valor entero del newValue.rawValue
            self.priorityNum = Int(newValue.rawValue)
        }
    }
    //7. priorityNum es un atributo que se almacenara en la BBDD pero en crudo
    @Attribute(originalName: "priority") var priorityNum: Priority.RawValue

    var isCompleted : Bool
    
    init(id: UUID = UUID(), title: String = "", priority: Priority = .normal, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        //8. Debemos cambiar la prioridad en su valor en crudo
        self.priorityNum = priority.rawValue
        self.priority = priority
    }
}
