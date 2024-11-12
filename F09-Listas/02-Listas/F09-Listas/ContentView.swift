//
//  ContentView.swift
//  F09-Listas
//
//  Created by Danilo Andrusco on 13-02-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List{
            //1. Para no tener que escribir N veces lo hacemos con un bucle for
            ForEach(1...5, id: \.self) { idx in
                Text("Elemento \(idx)")
            }
        }
    }
}

#Preview {
    ContentView()
}

