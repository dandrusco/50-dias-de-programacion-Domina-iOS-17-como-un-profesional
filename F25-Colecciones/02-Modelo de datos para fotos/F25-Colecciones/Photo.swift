//
//  Photo.swift
//  F25-Colecciones
//
//  Created by Danilo Andrusco on 12-12-24.
//

import Foundation

//4. la estructura sera Identifiable para poder recorrer las imagenes
struct Photo: Identifiable{
    //5. Tendremos un ID y un NOMBRE
    var id = UUID()
    var name : String
}

//5. Creamos un Arrays con el nombre de cada foto
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
