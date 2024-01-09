//
//  ContentView.swift
//  F08-Animaciones
//
//  Created by Danilo Andrusco on 05-01-24.
//

import SwiftUI

struct ContentView: View {
    
    //1. Ahora lo que buscamos es que el RoundedRectangle de color verde este oculto y que solo se muestre una vez presionemos en ver detalles, para ello crearemos un estado
    @State private var showDetails = false
        
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 250, height: 250)
                .foregroundStyle(.teal)
                .overlay(
                    Text("Ver detalles")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundStyle(.white)
                )
            
            //2. Ocultaremos el RoundedRectangle verde con el condicional if
            if showDetails {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 250, height: 250)
                    .foregroundStyle(.green)
                    .overlay(
                        Text("Estas viendo la vista del detalle")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundStyle(.white)
                            .padding()
                    )
                    //5. Podemos utilizar una animacion alternativa, para ello podemos utilizar el .transition y seleccionar por ejemplo el escalado
                    //.transition(.scale(scale: 0, anchor: .top))
                
                    //6. Podriamos utilizar por ejemplo un offset
                    .transition(.offset(x: 600, y: 0))
            }
        }
        //3. Crearemos la opcion que el ver detalles sea cliqueable
        .onTapGesture {
            //4. Creamos la animacion
            withAnimation(.default){
                showDetails.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
