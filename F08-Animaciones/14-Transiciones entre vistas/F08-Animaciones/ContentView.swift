//
//  ContentView.swift
//  F08-Animaciones
//
//  Created by Danilo Andrusco on 05-01-24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        //1. Crearemos una VStack
        VStack {
            //2. Pindaremos un RoundedRectangle
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 250, height: 250)
                .foregroundStyle(.teal)
                //3. Crearemos un overlay para poner un texto
                .overlay(
                    Text("Ver detalles")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundStyle(.white)
                )
            //4. Copiamos y pegamos el RoundedRectangle, pero le cambiaremos el color y el texto
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 250, height: 250)
                .foregroundStyle(.green)
                .overlay(
                    Text("Estas viendo la vista del detalle")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundStyle(.white)
                        //6. Le añadiremos un padding
                        .padding()
                )
        }
    }
}

#Preview {
    ContentView()
}
