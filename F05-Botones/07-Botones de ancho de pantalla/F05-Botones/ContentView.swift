//
//  ContentView.swift
//  F05-Botones
//
//  Created by Danilo Andrusco on 05-12-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            print("Hemos pulsado el boton")
        }, label: {
            Label (
                title: {
                    Text("Elimninar")
                        .fontWeight(.bold)
                        .font(.title)
                },
                icon: {
                    Image(systemName: "trash")
                        .font(.largeTitle)
                }
            )
            //1. Utilizaremos el Frame dandole infinity en la maxima anchura para que se expanda a lo ancho de la pantalla
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundStyle(.black)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color("PrimerColor"), Color("SegundoColor")]), startPoint: .top, endPoint: .trailing))
            .cornerRadius(40)
            .shadow(color: .gray, radius: 10, x: 15, y: 10)
            //2. Le añadiremos un pading horizontal de 10 puntos para que no llegue a los extremos del borde
            .padding(.horizontal, 10)
        })
    }
}

#Preview {
    ContentView()
}
