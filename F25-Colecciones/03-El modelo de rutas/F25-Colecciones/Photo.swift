//
//  Photo.swift
//  F25-Colecciones
//
//  Created by Danilo Andrusco on 12-12-24.
//

import Foundation

struct Photo: Identifiable{
    var id = UUID()
    var name : String
}

//2. Creamos una segunda estructura identificable, con ID, Imagenes y un arrays de fotos
struct LearningPath: Identifiable{
    var id = UUID()
    var image: String
    var photos: [Photo] = []
}


let photos = [
    Photo(name: "algebralineal"),
    Photo(name: "calculo"),
    Photo(name: "descriptiva"),
    Photo(name: "discreta"),
    Photo(name: "inferencia"),
    Photo(name: "ios10"),
    Photo(name: "ios11"),
    Photo(name: "ios12"),
    Photo(name: "ios13"),
    Photo(name: "latex"),
    Photo(name: "probabilidad"),
    Photo(name: "sage"),
    Photo(name: "selectividad"),
    Photo(name: "swift5")
]

//3. Creamos un arrays de paths con el arrays de LearningPath
let paths : [LearningPath] = [
    //4. Configuramos para las 3 rutas agregando un arrays de las fotos de las rutas, segun corresponda
    LearningPath(image: "_ruta-analisis-datos", photos: [photos[0], photos[2], photos[4], photos[10]]),
    LearningPath(image: "_ruta-ios", photos: [photos[5], photos[6], photos[7], photos[8], photos[13]]),
    LearningPath(image: "_ruta-matematicas", photos: [photos[0], photos[1], photos[2], photos[3], photos[4], photos[9], photos[10], photos[11], photos[12]])
]

//4. Creamos un nnuevo fichero de swiftUIview llamado LearningPathsView
