//
//  ContentView.swift
//  F15-Gestos
//
//  Created by Danilo Andrusco on 20-05-24.
//

import SwiftUI

struct ContentView: View {
    
    //1. Crearemos una variable de esta para ver si ha sido tocado, en principio sera falso
    @State private var isTapped = false
    
    var body: some View {
        Image(systemName: "book.circle.fill")
            .font(.system(size: 200))
            .foregroundStyle(.teal)
            //4. Cada vez que se precione cambiaremos el tamaño de escala
            .scaleEffect(self.isTapped ? 0.5 : 1.0)
            //5. Para que el cambio de escala no sea tan fuerte, podemos crear una animacion
            .animation(.bouncy, value: self.isTapped)
            .gesture(
                TapGesture()
                    .onEnded({
                        //2. Eliminaremos el print
                        /*print("Tocado!")*/
                        
                        //3. Cambiaremos de false a true y viceversa cada vez que se precione el boton
                        self.isTapped.toggle()
                    })
            )
        
    }
}

#Preview {
    ContentView()
}
