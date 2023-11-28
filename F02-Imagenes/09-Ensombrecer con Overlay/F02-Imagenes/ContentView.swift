//
//  ContentView.swift
//  F02-Imagenes
//
//  Created by Danilo Andrusco on 27-11-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("Bruno")
            .resizable()
            .ignoresSafeArea(.container, edges: .all)
            .aspectRatio(contentMode: .fill)
            .frame(width: 400, height: 400)
            //1. Eliminaremos el circulo y la trasparencia
            /*.clipShape(Circle())
            .opacity(0.5)*/
            //3. Agregaremos .clipped() para que queden iguales
            .clipped()
            .overlay(
                //2. Pondremos un rectangulo de color negro cvon una opacidad al 0.4
                Rectangle()
                    .foregroundStyle(.black)
                    .opacity(0.4)
            )
    }
}

#Preview {
    ContentView()
}
