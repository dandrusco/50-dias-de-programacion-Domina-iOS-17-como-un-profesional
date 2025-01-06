//
//  ContentView.swift
//  F32-Asincrono
//
//  Created by Danilo Andrusco on 06-01-25.
//

import SwiftUI

struct ContentView: View {
    
    //1. Crearemos una constante que contendra una imagen en una URL
    let imageURL = "https://import.cdn.thinkific.com/630745%2Fcustom_site_themes%2Fid%2FGbgsVDDrT4uAGrrQShBC_juan-gabriel-gomila.jpg"
    
    var body: some View {
        VStack {
            //2. Para poder meter la imagen debemos crearla con AsyncImage, donde le pasaremos la URL
            AsyncImage(url: URL(string: self.imageURL),
                       //3. Podemos el tamaño con scale
                       scale: 1.5)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
