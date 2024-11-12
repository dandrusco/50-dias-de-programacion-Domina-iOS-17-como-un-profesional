//
//  ContentView.swift
//  F04-ScrollViews
//
//  Created by Danilo Andrusco on 04-12-23.
//


//1. Vamos a crear un nuevo fichero de SwiftUI View llamado CardView
//2. Em la carpeta recursos tenemos un ZIP llamado Tema 4, arrastraremos las 5 imagen a nuestro Assets

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
