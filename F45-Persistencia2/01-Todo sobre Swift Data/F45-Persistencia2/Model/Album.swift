//
//  Album.swift
//  F45-Persistencia2
//
//  Created by Danilo Andrusco on 31-01-25.
//

import Foundation
//9. Importamos SwiftData
import SwiftData

//10. Creamos otro modelo
@Model class Album {
    //11. Creamos las variables necesarias pero con la salvedad que el nombre sera unico y no se podra repetir, para ello utilizamos un atributo
    @Attribute(.unique) var name: String
    var artist: String
    var genre: String
    
    //12. Como un artita tiene canciones podemos crear una variable para el album con un array de cancion, de tipo opcional y con un arrays vacio en principio. (Lo dejaremos comentado para otro ejemplo)
    /*var songs : [Song]? = []*/
    
    //13. Como mi album va a ser un objeto persistido, si quisieramos borrar este album de la base de dato ¿Que ocurre con las canciones de ese album? para ello podemos poner un @Relationship indicandole un borrado en cascada
    @Relationship(.cascade) var songs : [Song]? = []
    //15. En la actualizad esta linea esta arrojando error
    
    //14. Creamos el inicalizador
    init(name: String, artist: String, genre: String, songs: [Song]? = nil) {
        self.name = name
        self.artist = artist
        self.genre = genre
        self.songs = songs
    }
}

//16. Nos vamos al F45_persostencia2App
