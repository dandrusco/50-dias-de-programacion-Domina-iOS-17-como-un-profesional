//
//  ContentView.swift
//  F03-Apilar
//
//  Created by Danilo Andrusco on 28-11-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1. Por defecto SwiftUI nos crea una vertical Stack permitiendonos aplilar uno debajo del otro
        VStack {
            //2. Tenemos por defecto una imagen de FS Symbols llamada globe
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            //3. Y por dejabo el texto e hola mundo
            Text("Hello, world!")
            //4. Podemos agregar una nosotros, ya sea texto, imagen, simbolos, botoenes, etc
            Text("Que pasa brother")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
