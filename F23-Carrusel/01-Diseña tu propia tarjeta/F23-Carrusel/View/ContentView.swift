//
//  ContentView.swift
//  F23-Carrusel
//
//  Created by Danilo Andrusco on 08-12-24.
//

//1. Comenzaremos a preparar nuestro proyecto, para ello necesitaremos las imagenes del proyecto F09-Listas vamos a entrar en las imagenes de los cursos, para ello copiaremos la carpeta Assets.xcassets y la reemplazamos por la de este proyecto
//2. Corroboramos haciendo clic en Assets para ver si estan todas cargadas
//3. Creamos dos carpetas, una para el modelo y el otro para la vista
//4. La ContentView la arrastro hacia la vista
//5. Dentro de la carpeta view creamos un nuevo fichero de siftUi llamado CardView
//6. Dentro de Model creamos un nuevo fichero de Swift llamado Course
//7. Nos vamos a Course para crear nuestro modelo
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
