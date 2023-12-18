//
//  ContentView.swift
//  F06-Estados
//
//  Created by Danilo Andrusco on 11-12-23.
//

import SwiftUI

struct ContentView: View {
    
    //1. Como pueden ver tanto en el estado como en el vinculo, ambas variables se llaman counter
    @State private var counter = 0

    var body: some View {
        VStack {
            HStack {
                //3. Ahora podemos entender un poco mejor como conteo utiliza un vinculo de counter
                RoundedButton(conteo: $counter, color: .red)
                RoundedButton(conteo: $counter, color: .yellow)
            }
            HStack {
                RoundedButton(conteo: $counter, color: .green)
                RoundedButton(conteo: $counter, color: .blue)
            }
        }
        .padding()
    }
}

struct RoundedButton: View {
    
    //2. Para no enredarse le cambiaremos el nombre a esta, para ello boton derecho, refactor -> rename y la llamaremos conteo
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
