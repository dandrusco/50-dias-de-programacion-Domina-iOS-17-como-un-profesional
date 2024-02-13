//
//  ContentView.swift
//  F09-Listas
//
//  Created by Danilo Andrusco on 13-02-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1. podemos simplificarlo aun mas eliminadno el parametro ForEach
        /*List{
            ForEach(1...5, id: \.self) {
                Text("Elemento \($0)")
            }
        }*/
        //2. Pasandoselo directamente a la Lista
        List(1...5, id: \.self) {
            Text("Elemento \($0)")
        }
    }
}

#Preview {
    ContentView()
}

