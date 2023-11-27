//
//  ContentView.swift
//  F02-Imagenes
//
//  Created by Danilo Andrusco on 27-11-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1. Para poder poner simbolños podemos descargar la app de apple llamada Simbolos FS, la debemos llamar atravez de Image,systemName y su nombre
        Image(systemName: "externaldrive.fill.badge.exclamationmark")
        //2. En el fondo no es un simbolo, mas bien una letra, por lo tanto para ajustar el tamaño podemos utilizar font
            .font(.system(size: 80))
        //3. Para el color
            .foregroundStyle(.cyan)
        //4. Aplicando sombra
            .shadow(color: .gray, radius: 10, x: 0, y: 10)
    }
}

#Preview {
    ContentView()
}
