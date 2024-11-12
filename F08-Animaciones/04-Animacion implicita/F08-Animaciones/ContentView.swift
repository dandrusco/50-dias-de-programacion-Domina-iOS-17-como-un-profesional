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
        //1. En vez de crear una animacion para el circulo y otra para el tamaño del corazon, se lo podemos pasar directamente a la ZStack
        ZStack{
            Circle()
                .frame(width: 250, height: 250)
                .foregroundStyle(circleChanged ? Color(.systemGray6) : .teal)
                //2. Corto esta animacion y la pego al final de la ZStack
                /*.animation(.default, value: circleChanged)*/
            
            Image(systemName: "heart.fill")
                .font(.system(size: 80))
                .foregroundStyle(heartColorChanged ? .teal : Color(.systemGray6))
                .scaleEffect(heartSizeChanged ? 1.5 : 0.75)
                //3. Corto esta animacion y la pego al final de la ZStack
                /*.animation(.default, value: heartSizeChanged)*/
        }
        .animation(.default, value: circleChanged) //No es necesario ocupar la animacion por defecto, tambien esta la .lenear, spring, easeOUT, etc.
        .animation(.default, value: heartSizeChanged)
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
