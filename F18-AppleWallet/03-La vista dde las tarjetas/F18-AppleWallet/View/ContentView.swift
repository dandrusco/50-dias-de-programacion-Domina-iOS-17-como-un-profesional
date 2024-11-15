//
//  ContentView.swift
//  F18-AppleWallet
//
//  Created by Danilo Andrusco on 12-11-24.
//

//1. Crearemos la vista de la tarjeta para ello crearemos un nuevo archivo de SwiftUI llamado CardView

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
