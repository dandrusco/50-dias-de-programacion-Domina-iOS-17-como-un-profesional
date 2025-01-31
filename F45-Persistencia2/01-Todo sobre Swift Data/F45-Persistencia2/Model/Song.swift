//
//  Song.swift
//  F45-Persistencia2
//
//  Created by Danilo Andrusco on 31-01-25.
//

import Foundation
//4. Debemos importar Swift Data
import SwiftData


//5. Crearemos una clase llamada Song para las canciones, pero deberemos anteponer @Model para indicarle que pertenece a SwiftData
@Model class Song{
    //5. Creamos las variables
    var title: String
    var artist: String
    var album: String
    var genre: String
    var rating: Double
    
    //6. Creamos el inicializador
    init(title: String, artist: String, album: String, genre: String, rating: Double) {
        self.title = title
        self.artist = artist
        self.album = album
        self.genre = genre
        self.rating = rating
    }
}
//7. Como podemos ver con tan solo invocar a @Model siwfit data habilita la persistencia de datos
//8. Vamos a crear otro archivo pero lo llamaremos Album dentro de la carpeta Model
