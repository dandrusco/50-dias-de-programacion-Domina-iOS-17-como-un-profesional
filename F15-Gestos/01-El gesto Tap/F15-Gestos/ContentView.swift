//
//  ContentView.swift
//  F15-Gestos
//
//  Created by Danilo Andrusco on 20-05-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1. Crearemos una imagen de un libro
        Image(systemName: "book.circle.fill")
            .font(.system(size: 200))
            .foregroundStyle(.teal)
        
        //2. Añadiremos un gesto
            .gesture(
                //3. Meteremos un TapGesture para reconocer los Taps que le demos a la pantalla
                TapGesture()
                //4. Cuando acabe el tap (clips) le añadiremos una accion
                    .onEnded({
                        print("Tocado!")
                    })
            )
        
    }
}

#Preview {
    ContentView()
}
