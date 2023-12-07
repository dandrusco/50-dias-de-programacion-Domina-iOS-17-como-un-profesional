//
//  ContentView.swift
//  F05-Botones
//
//  Created by Danilo Andrusco on 05-12-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //1. Vamos a copiar y pegar tres boton pero solo hasta }) dejando .tint... afuera del VStack
            Button(action: {
                print("Hemos pulsado el boton")
            }, label: {
                //3. Le cambiamos el texto
                Text("Añadir")
            })
            
            Button(action: {
                print("Hemos pulsado el boton")
            }, label: {
                //4. Le cambiamos el texto
                Text("Buscar")
            })
            
            Button(action: {
                print("Hemos pulsado el boton")
            }, label: {
                //5. Le cambiamos el texto
                Text("Pagar")
            })
        }
        //2. Al dejarlo afuera opera como si fuera una estructura para los 3 boton como lo vimos en los primeros videos del boton
        .tint(.cyan)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 15))
        .controlSize(.large)
    }
}

#Preview {
    ContentView()
}
