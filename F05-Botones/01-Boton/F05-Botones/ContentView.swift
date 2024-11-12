//
//  ContentView.swift
//  F05-Botones
//
//  Created by Danilo Andrusco on 05-12-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1. Crearemos un boton
        Button{
            //2. Aqui va el comportamiento
            print("Pulsé el boton")
        //3. En el label va el texto, color, etc.
        } label: {
            Text("Hola Mundo!")
                //8. Como podemos ver entre la caja y el texto esta todo muy junto, para ello le aplicaremos un padding, lo debemos poner siempre antes del color o no se vera reflejado
                .padding()
                //5. Podemos ponerle un color de fondo
                .background(Color.green)
                //6. Color de texto
                .foregroundStyle(.white)
                //7. Tipo de fuente
                .font(.title)
        }
        
        //4. La sintaxis antigual era asi:
        Button(action: {
            print("Pulsé el boton antiguo")
        }, label: {
            Text("Boton antiguo")
        })
    }
}

#Preview {
    ContentView()
}
