//
//  ContentView.swift
//  F44-Redondeos
//
//  Created by Danilo Andrusco on 29-01-25.
//

import SwiftUI

struct ContentView: View {
    
    //1. Podemos animar los diferentes bordes, para ello necesitamos una variable de estado
    @State private var animated = false
    
    var body: some View {
        Button(action: {
            //2. Ahora en vez de imprimir deberemos crear una animacion, para ello eliminamos el print y agregamos la withAnimation
            /*print("Boton pulsado")*/
            withAnimation {
                //3. Ahora simplemente pasamos de false a true con .toggle()
                self.animated.toggle()
            }
        }) {
            Text("Empezar")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
        .tint(.white)
        .frame(width: 300, height: 100)
        .background {
            //4. Cambiaremos la configuracion del .int, ahora dependera de la bariable de estado si esta en true o false
            UnevenRoundedRectangle(cornerRadii:
                    .init(topLeading: self.animated ? 90.0 : 10.0,
                          bottomLeading: self.animated ? 10.0 : 90.0,
                          bottomTrailing: self.animated ? 10.0 : 90.0,
                          topTrailing: self.animated ? 90.0 : 10.0),
                                   style: .continuous)
            //5. Ahora si precionamos el boton pasa de estar "sonriente" a "triste"
            .frame(width: 300, height: 100)
            .foregroundStyle(.teal)
        }
    }
}

#Preview {
    ContentView()
}
