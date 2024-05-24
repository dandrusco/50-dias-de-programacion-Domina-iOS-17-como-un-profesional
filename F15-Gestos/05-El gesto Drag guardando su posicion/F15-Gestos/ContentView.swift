//
//  ContentView.swift
//  F15-Gestos
//
//  Created by Danilo Andrusco on 20-05-24.
//


//1. Cada dez que arrastramos y luego soltamos, este icono vuelve a su posision original, esto ocurre por que el @GestureState resetea a su posicion original que en nuestro caso esta inicializamos a zero
import SwiftUI

struct ContentView: View {
    
    @GestureState private var dragOffset = CGSize.zero
    //2. Crearemos una segunda propiedad que sea capaza de guardar la posicion actual que nosotros movamos el icono que tambien estara inicializada a cero ya que al principio nadie la ha movido
    @State private var currentPosition = CGSize.zero
    
    var body: some View {
        Image(systemName: "book.circle.fill")
            .font(.system(size: 100))
            .foregroundStyle(.teal)
            //5. Deberemos moficiar el offset ya que no solo le pasamos el dragOffset, sino que tambien el currentPosition sumando ambos
            .offset(x: self.currentPosition.width + self.dragOffset.width, y: self.currentPosition.height + self.dragOffset.height)
            .animation(.easeInOut, value: self.dragOffset)
            .gesture(
                DragGesture()
                    .updating(self.$dragOffset, body: { value, state, transaction in
                        state = value.translation
                    })
                    //3. Implementaremos un onEned campurando el valor del dragOffset para actualizar la posicion del movimiento en el currentPosition
                    .onEnded({ value in
                        //4. cuando terminamos de desplazarnos, capturaremos la altura y la anchura incrementandola segun corresponda
                        self.currentPosition.height += value.translation.height
                        self.currentPosition.width += value.translation.width
                    })
            )
    }
}

#Preview {
    ContentView()
}
