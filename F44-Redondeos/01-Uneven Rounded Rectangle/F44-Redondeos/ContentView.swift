//
//  ContentView.swift
//  F44-Redondeos
//
//  Created by Danilo Andrusco on 29-01-25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        //5. Vamos a meter esto a un boton
        Button(action: {
            print("Boton pulsado")
        }) {
            Text("Empezar")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
        .tint(.white)
        .frame(width: 300, height: 100)
        //6. Dentro de background debemos meter el UnevenRoundedRectangle
        .background {
            //1. con UnevenRoundedRectangle podemos crear figuras rectangulares pero con los bordes redondeados de diferentes radios en cada caso, deberemos especificar el parametro cornerRadii para cada uno de los bordes, debemos invocar al .init para configurar tanto el topLeading (borde de arriba a la izquierda), bottomLeading (borde de abajo a la izquierda), bottomTrailing (borde de abajo a la derecha) y topTrailing (borde de arriba a la derecha)
            //4. Adicional podemos agregar el estimo, puede ser circular o continuo (mas suave)
            UnevenRoundedRectangle(cornerRadii:
                    .init(topLeading: 60.0,
                          bottomLeading: 0,
                          bottomTrailing: 40.0,
                          topTrailing:30.0),
                                   style: .continuous)
            //2 Configuramos el frame y el color
            .frame(width: 300, height: 100)
            .foregroundStyle(.teal)
            //3. Vemos que esto pareec los mensajes de Messenger
        }
    }
}

#Preview {
    ContentView()
}
