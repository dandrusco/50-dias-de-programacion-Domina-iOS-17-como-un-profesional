//
//  ContentView.swift
//  F08-Animaciones
//
//  Created by Danilo Andrusco on 05-01-24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var circleChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 250, height: 250)
                //2. Cambiaremos el color por un systemGray6
                .foregroundStyle(circleChanged ? Color(.systemGray6) : .teal)
                //1. Crearemos una anumacion para que le de un toque mas bonito entre los cambios, para ello utilizaremos la animacion por defecto y que afectara al circleChanged
                .animation(.default, value: circleChanged)
            
            Image(systemName: "heart.fill")
                .font(.system(size: 80))
                //3. Cambiaremos el color por un systemGray6
                .foregroundStyle(heartColorChanged ? .teal : Color(.systemGray6))
                .scaleEffect(heartSizeChanged ? 1.5 : 0.75)
                //4. Creamos la animacion para el heartSizeChanged
                .animation(.default, value: heartSizeChanged)
                //5. Lo que SwiftUI hace es que esta esperando que el valor de heartSizeChanged cambie para meterle una animacion
        }
        .onTapGesture {
            circleChanged.toggle()
            heartColorChanged.toggle()
            heartSizeChanged.toggle()
        }
    }
}

#Preview {
    ContentView()
}
