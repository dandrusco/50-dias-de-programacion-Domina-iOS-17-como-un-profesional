//
//  ContentView.swift
//  F09-Listas
//
//  Created by Danilo Andrusco on 13-02-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1. Crearemos una lista
        List{
            //2. Pondremos 5 textos
            Text("Elimento 1")
            Text("Elimento 2")
            Text("Elimento 3")
            Text("Elimento 4")
            Text("Elimento 5")
        }
    }
}

#Preview {
    ContentView()
}

