//
//  ContentView.swift
//  F19-Prestamos
//
//  Created by Danilo Andrusco on 21-11-24.
//

//1. Crearemos una nueva carpeta llamada View y añadiremos este archivo
//2. Crearemos 2 archivo de Swift UI en esta carpeta, el primero llamado CellView y FilterView
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
