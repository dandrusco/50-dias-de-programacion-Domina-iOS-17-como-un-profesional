//
//  ContentView.swift
//  F08-Animaciones
//
//  Created by Danilo Andrusco on 05-01-24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isLoading = false
        
    var body: some View {
        HStack {
            //1. Crearemos un bucle ForEach que ira del 0 al 6
            ForEach(0...5, id: \.self){ idx in
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.teal)
                    .scaleEffect(isLoading ? 0 : 1)
                    //2. Si se fijan los 6 puntos aparencen y desaparecen al mismo tiempo, para ello podemos poner yn dalay en la animacion dividiendo el indice entre 6
                    .animation(.linear(duration: 0.7).repeatForever().delay(Double(idx)/6),value: isLoading)
            }
        }
        .onAppear() {
            isLoading = true
        }
    }
}

#Preview {
    ContentView()
}
