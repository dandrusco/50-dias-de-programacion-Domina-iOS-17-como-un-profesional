//
//  ContentView.swift
//  F05-Botones
//
//  Created by Danilo Andrusco on 05-12-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                print("Hemos pulsado el boton")
            }, label: {
                Text("Añadir")
            })
            
            Button(action: {
                print("Hemos pulsado el boton")
            }, label: {
                Text("Buscar")
            })
            
            Button(action: {
                print("Hemos pulsado el boton")
            }, label: {
                Text("Pagar")
            })
            
            //2. Crearemos un boton para eliminar, con roles que sera de tipo destructivo
            Button("Eliminar", role: .destructive) {
                //3. Aqui va su accion
                print("Boton Eliminar pulsado")
            }
            //4. Como podemos apreciar SwiftUI automaticamente nos crea el texto y/o boton de color rojo
            
            //5. Podemos crear el de cancelar
            Button("Cancelar", role: .cancel) {
                //3. Aqui va su accion
                print("Boton Cancelar pulsado")
            }
        }
        //1. vamos a ver que Swift cuenta con roles para los botones, para ello y que se entienda mejor el ejemplo eliminaremos el tinte de los colores
        /*.tint(.cyan) */
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 15))
        .controlSize(.large)
    }
}

#Preview {
    ContentView()
}
