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
            //1. Podemos omitir el parametro index y agregando el $0 obtenemos el mismo resultado
            /*ForEach(1...5, id: \.self) { idx in
                Text("Elemento \(idx)")
            }*/
            ForEach(1...5, id: \.self) {
                Text("Elemento \($0)")
            }
        }
    }
}

#Preview {
    ContentView()
}

