//
//  ContentView.swift
//  F08-Animaciones
//
//  Created by Danilo Andrusco on 05-01-24.
//

import SwiftUI

struct ContentView: View {
    
    //4. Crearemos un estado para la animacion de carga
    @State private var isLoading = false
    
    var body: some View {
        //1. Vamos a crear un circulo de carga al 75%
        Circle()
            .trim(from: 0, to: 0.75)
            //2. Solo pintaremos la linea de grosor 8
            .stroke(.teal, lineWidth: 8)
            //3. Creamos su tamaño de 200 x 200
            .frame(width: 200, height: 200)
            //4. Aplicaremos el efecto del isLoading cuando sea true
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            //5. Si cambiamos el isLoading de false a true hasta el momento no notaremos el cambio, ya que de 0 a 360 basicamente es lo mismo, pero si lo hacemos con una animacion LINEAR si veremos como da una vuelta, pero como necesitamos que de mas de una vuelta, a la animacion le diremos que la repita por siempre, ademas el parametro autoreverses (para autorevertir la animacion) le diremos que no
            .animation(.linear(duration: 0.5).repeatForever(autoreverses: false), value: isLoading)
            //6. Ahora le diremos que la animacion parta cuando arraque la vista .onAppear
            .onAppear(){
                isLoading = true
            }
    }
}

#Preview {
    ContentView()
}
