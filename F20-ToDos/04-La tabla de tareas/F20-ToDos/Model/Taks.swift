//
//  Taks.swift
//  F20-ToDos
//
//  Created by Danilo Andrusco on 23-11-24.
//

import Foundation
//2. Lo primordial sera importar SwiftData
import SwiftData

//3. Nuestras lista de tarea seran por proriedad, baja, normal y alta
enum Priority: Int {
    case low = 1
    case normal = 2
    case high = 3
    
    //4. Vamos a crear una funcion de tipo Sting para traducir las prioridades y asi mostrarle al usuario letras en vez de nuemeros
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
}

//5. Crearemos una clase observable que nos permite añadir un soporte adicional a nuestra vista de tareas de tipo Identifiable
@Observable class Task: Identifiable{
    //6. Crearemos las variables para el ID, Titulo, la prioridad y si la tarea a terminado o no
    var id : UUID
    var title:String
    var priority: Priority
    var isCompleted : Bool
    
    //Creamos el constructor, con el titulo vacio, con la prioridad normar y la tarea si esta completado en falso
    init(id: UUID = UUID(), title: String = "", priority: Priority = .normal, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.priority = priority
        self.priority = priority
    }
}
