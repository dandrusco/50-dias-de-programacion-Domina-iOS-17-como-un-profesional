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
            //1. Para crear un circulo primero eliminaremos el clipped, y en el frame lo dejaremos en 400x400, luego con clipShape le indicamos que es cirlular
            .clipShape(Circle())//Podemos probar con elipse y capsula pero deberemos eliminar la altura del frame
            //2. Para la opacidad
            .opacity(0.5)//0 es invisible y 1 es 100% visible
            //3. Podemos poner un simbolo por encima de la imagen, esto se conoce como un overlay (otra vista)
            .overlay(
                Image(systemName: "hand.thumbsup.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(.blue)
                    .opacity(0.8)
            )
    }
}

#Preview {
    ContentView()
}
