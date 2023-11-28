//
//  ContentView.swift
//  F02-Imagenes
//
//  Created by Danilo Andrusco on 27-11-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1. Algunos iconos nos permite variar el % de progrecion, por ejemplo en este caso podemos cambiar la intensidad del wifi, para ello tendremos que agregar un segundo parametro llamado variableValue indicandole por ej,plo un 60%
        Image(systemName: "externaldrive.fill.badge.wifi", variableValue: 0.6)
            .symbolRenderingMode(.palette)
            .font(.system(size: 80))
            .foregroundStyle(.cyan, .yellow)
            .shadow(color: .gray, radius: 15, x: 0, y: 10)
    }
}

#Preview {
    ContentView()
}
