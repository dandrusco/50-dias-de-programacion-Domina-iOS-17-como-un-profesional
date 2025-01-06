//
//  ContentView.swift
//  F32-Asincrono
//
//  Created by Danilo Andrusco on 06-01-25.
//

import SwiftUI

struct ContentView: View {
    
    let imageURL = "https://import.cdn.thinkific.com/630745%2Fcustom_site_themes%2Fid%2FGbgsVDDrT4uAGrrQShBC_juan-gabriel-gomila.jpg"
    
    var body: some View {
        VStack {
            //1. Borraremos la escala y le añadiremos un cloucher
            AsyncImage(url: URL(string: self.imageURL)){ image in
                //2. Creamos la imagen configurando sus parametros
                image.resizable()
                    .scaledToFill()
            //3. Configuraremos el placeholder, quien se encarga de mostrar una pantalla antes de que se cargue de la URL, la configuraremos con color teal y una opacidad
            }placeholder: {
                Color.teal.opacity(0.3)
            }
            //4. Tambien podemos configurar el frame
            .frame(width: 320, height: 520)
            //5. Y tambien un redondeado
            .cornerRadius(24)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
