//
//  Task.swift
//  F45-Persistencia2
//
//  Created by Danilo Andrusco on 31-01-25.
//


import Foundation
//8. Importamos SwiftData
import SwiftData

//9. Anteponemos el @Model para la creacion de nuestra clase de tareas con el protocolo Identifiable
@Model class Task: Identifiable{
    
    //10. Creamos la variable ID como inica, el nombre como String y si esta completada como booleana
    var id: UUID
    var name: String
    var completed: Bool
    
    //11. Creamos el inicializador, configurando los valores por defecto
    init(id: UUID = UUID(), name: String = "", completed: Bool = false) {
        self.id = id
        self.name = name
        self.completed = completed
    }
    
}
//12. Ahora necesitamos hacer dos cosas mas, primero nos vamos al F45_Persistencia2App
