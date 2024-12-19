//
//  Photo.swift
//  F29-Fotos
//
//  Created by Danilo Andrusco on 19-12-24.
//


import Foundation

//5. Creamos la estructura que sea Identifiable para utilizar el ID y nombre
struct Photo: Identifiable {
    var id = UUID()
    var name: String
}

//6. Creamos una constante que mapee las fotos del 1 a la 14, creando un objeto de la clase foto, pasandole cada una de las imagenes
let samplePhotos = (1...14).map{ Photo(name: "\($0)") }
