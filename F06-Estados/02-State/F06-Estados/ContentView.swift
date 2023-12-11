//
//  ContentView.swift
//  F06-Estados
//
//  Created by Danilo Andrusco on 11-12-23.
//

import SwiftUI

struct ContentView: View {
    
    //1. Para poder monitorizar el estado de esta variable, deberemos anteponer un @State, de esta manera SwiftUI sera el encargado de manejar todos los cambios que se realizen en esta variable. Estos estados deberan ser siempre privados, y solo podemos acceder a el desde el body
    @State private var isPlaying = false

    var body: some View {
        VStack {
            Button{
                //2. Para implementar la accion llamamos a isPlaying con toggle() que nos permite cambiar de false a true y viceversa
                isPlaying.toggle()
            } label: {
                Image(systemName: isPlaying ? "stop.circle" : "play.circle")
                    .font(.system(size: 80))
                    .foregroundStyle(isPlaying ? .red : .cyan)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
