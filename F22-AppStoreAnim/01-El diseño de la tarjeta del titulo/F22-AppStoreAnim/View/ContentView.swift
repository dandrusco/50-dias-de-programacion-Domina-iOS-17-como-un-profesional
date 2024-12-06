//
//  ContentView.swift
//  F22-AppStoreAnim
//
//  Created by Danilo Andrusco on 05-12-24.
//


//1.Como ya es costumbre crearemos dos carpetas, una para las vistas y la otra para el modelo
//2. El archivo de la ContentView lo meteremos en la Vista
//3. Copiaremos el modelo de datos de los articulos de la carpeta F10 y lo pegaremos en nuestra carpeta Model
//4. De la misma carpeta F10 nos debemos traer toda la caepeta Assets.xcassets ya que contiene las imagenes
//5. Crearemos una un nuevo fichero de SwiftUI que llamaremos TitleView
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
