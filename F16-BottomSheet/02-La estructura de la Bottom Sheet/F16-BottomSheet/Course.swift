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
    //1. Vamos a añadir una nueva variable que asociaremos a la ruta de nuestro curso
    var path: String
    
    //3. Tambien podemos crear nuestros propios inicializadores, podemos seleccionar la primera opcion de autocompletarse, por lo tanto estaria esperando que cuando yo reciba uno de estos parametros me lo va a asignar a cada variable segun corresponda
    init(id: UUID = UUID(), name: String, image: String, author: String, difficulty: Int, description: String, path: String) {
        self.id = id
        self.name = name
        self.image = image
        self.author = author
        self.difficulty = difficulty
        self.description = description
        self.path = path
    }
    
    //4. Tambien podemos crear un inicializador vacio
    init(){
        self.init(name: "", image: "", author: "", difficulty: 1, description: "", path: "")
    }
}

//5. Necesitamos crear una estructura, para ello crearemos un nuevo archivo de SwiftUI que llamaremos CourseDetailView

