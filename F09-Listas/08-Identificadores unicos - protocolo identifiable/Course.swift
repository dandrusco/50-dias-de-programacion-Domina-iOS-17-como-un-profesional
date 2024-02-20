//
//  Course.swift
//  F09-Listas
//
//  Created by Danilo Andrusco on 13-02-24.
//

import Foundation

//2. A esta estructura le indicaremos que implementaremos el protocolo identifiable
struct Course: Identifiable{
    var id = UUID()
    var name: String
    var image: String
}

//3. El proposito de implementar este protocolo es que podemos utilizar la lista sin especificar cual es el parametro de identificador
