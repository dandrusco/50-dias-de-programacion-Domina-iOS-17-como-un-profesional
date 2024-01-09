//
//  ContentView.swift
//  F08-Animaciones
//
//  Created by Danilo Andrusco on 05-01-24.
//

import SwiftUI

struct ContentView: View {
    
    //1. Vamos a crear unos puntos de carga, para ello utilizaremos el stado isLoading en principio false
    @State private var isLoading = false
        
    var body: some View {
        //2. Crearemos un HStack para ponerlo uno al lado de otro
        HStack {
            //3. Crearemos un circulo de 20x20
            Circle()
                .frame(width: 20, height: 20)
                .foregroundStyle(.teal)
                //4. Si la vaiable es false tendra tamaño 0 y si es verdadera tendra tamaño 1
                .scaleEffect(isLoading ? 0 : 1)
                //5. Crearamos la animacion y que se repita por siempre
                .animation(.linear(duration: 0.7).repeatForever(),value: isLoading)
        }
        //6. Con onAppear a penas arranque la aplicacion cambiaremos el valor del estado isLoading a verdadero
        .onAppear() {
            isLoading = true
        }
    }
}

#Preview {
    ContentView()
}
