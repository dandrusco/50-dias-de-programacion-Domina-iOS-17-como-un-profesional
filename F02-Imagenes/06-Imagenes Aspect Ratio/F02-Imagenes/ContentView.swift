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
            //1. cambiaremos el width por 300 y le agregaremos una altura de 500
            .frame(width: 300, height: 500)
            //2. Si no queremos que la imagen salga por fuera, podemos utilizar clipped para recortarla por dentro
            .clipped()
    }
}

#Preview {
    ContentView()
}
