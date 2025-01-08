//
//  Photo.swift
//  F35-Compartir
//
//  Created by Danilo Andrusco on 08-01-25.
//

import SwiftUI

//3. Creamos su estructura Identifiable con su ID, Imagen, Titutlo y una descripcion
struct Photo: Identifiable{
    var id = UUID()
    var image: Image
    var title: String
    var description: String
}

//4. Creamos una extencion que sea Transferable
extension Photo: Transferable {
    //5. Implementamos una Static var transferRepresentation
    static var transferRepresentation: some TransferRepresentation{
        //6. Exportaremos la imagen para esta prueba
        ProxyRepresentation(exporting: \.image)
    }
}
//7. Nos vamos a la ContentView
