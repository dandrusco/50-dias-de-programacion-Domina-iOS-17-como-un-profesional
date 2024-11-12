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
            Button(action: {
                print("Hemos pulsado el boton")
            }, label: {
                Text("Disfrutando del curso")
            })
            //1. Con el modificador Tint podemos colorear el texto del boton
            .tint(.cyan)
            //2. Con borderedProminent el color del texto pasa a ser blanco y el color del tint pasa al boton
            .buttonStyle(.borderedProminent)
            //3. Con buttonBorderShape podemos redondear el boton
            .buttonBorderShape(.roundedRectangle(radius: 15)) // con .automatic el boton se adaptara automaticamente 
            //4. para modificar el tamaño del boton
            .controlSize(.large)
        }
    }
}

#Preview {
    ContentView()
}
