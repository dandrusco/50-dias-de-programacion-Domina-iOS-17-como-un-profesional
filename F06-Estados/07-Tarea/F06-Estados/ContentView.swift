//
//  ContentView.swift
//  F06-Estados
//
//  Created by Danilo Andrusco on 11-12-23.
//

import SwiftUI

struct ContentView: View {
    
    //2. Cambiamos la variable de esta counter por una para cada color
    @State private var counterRed = 0
    @State private var counterYellow = 0
    @State private var counterGreen = 0
    @State private var counterBlue = 0

    var body: some View {
        VStack {
            //1. Pondremos un texto (en principio 0) que sera el encargado de contar todos los clics en cada boton
            //3. Ahora cambiaremos el "0" por la suma de cada contador
            Text("\(counterRed+counterYellow+counterGreen+counterBlue)")
                .font(.system(size: 100, weight: .bold, design: .rounded))
            HStack {
                RoundedButton(conteo: $counterRed, color: .red)
                RoundedButton(conteo: $counterYellow, color: .yellow)
            }
            HStack {
                RoundedButton(conteo: $counterGreen, color: .green)
                RoundedButton(conteo: $counterBlue, color: .blue)
            }
        }
        .padding()
    }
}

struct RoundedButton: View {
    
    @Binding var conteo: Int
    
    var color: Color
    
    var body: some View {
        Button{
            conteo += 1
        } label: {
            Circle()
                .frame(width: 150, height: 150)
                .foregroundStyle(color)
                .overlay(
                    Text("\(conteo)")
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
            )
        }
    }
}


#Preview {
    ContentView()
}
