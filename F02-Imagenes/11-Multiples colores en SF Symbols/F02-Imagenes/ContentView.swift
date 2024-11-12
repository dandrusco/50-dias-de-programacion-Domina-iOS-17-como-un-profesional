//
//  ContentView.swift
//  F02-Imagenes
//
//  Created by Danilo Andrusco on 27-11-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1. Veremos como poner mas de un color en SF Symbols, para ello seleccionaremos uno que sea de multicolor
        Image(systemName: "externaldrive.fill.badge.wifi")
            //2. con symbolRenderingMode podemos utilizar el gerarquico, monocrom o paleta
            .symbolRenderingMode(.palette)
            .font(.system(size: 80))
            //3. En el caso de este simbolo hacepta dos color
            .foregroundStyle(.cyan, .yellow)
            .shadow(color: .gray, radius: 15, x: 0, y: 10)
    }
}

#Preview {
    ContentView()
}
