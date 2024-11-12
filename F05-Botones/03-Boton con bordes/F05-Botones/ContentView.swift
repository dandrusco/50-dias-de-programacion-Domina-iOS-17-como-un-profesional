//
//  ContentView.swift
//  F05-Botones
//
//  Created by Danilo Andrusco on 05-12-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button{
            print("Pulsé el boton")
        } label: {
            Text("Hola Mundo!")
                .foregroundStyle(.black)
                .font(.title)
                //1. Pondremos la letra en negrita
                .fontWeight(.bold)
                //2. Pondremos un nuevo padding para agrandar aun mas la caja
                .padding()
                //3. Lo pintaremos en verde
                .background(Color.green)
                //5. Para que el boton quede redondeado aplicaremos un cornerRadius
                .cornerRadius(40)
                //4. Al Pading le pondremos un tamaño 10
                .padding(10)
                .border(Color.green, width: 4)
                //6. Si le ponemos un .cornerRadius(40) despues del borde vemos que no nos funciona, ya que se cortan losmargenes
                .cornerRadius(40)
        }
    }
}

#Preview {
    ContentView()
}
