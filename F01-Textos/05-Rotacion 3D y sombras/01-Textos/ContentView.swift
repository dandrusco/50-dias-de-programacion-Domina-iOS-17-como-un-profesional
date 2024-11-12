//
//  ContentView.swift
//  01-Textos
//
//  Created by Danilo Andrusco on 23-11-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("**Esto es un texto en negrita.** *Esto es un texto en cursiva* Podemos añadir un [link a un sitio web](http://www.tectroya.cl)")
            .foregroundStyle(.purple)
            .multilineTextAlignment(.center)
            .lineLimit(3)
            .truncationMode(.head)
            .lineSpacing(12)
            .padding(40)
            //1. Para rotar en 3D utilizaremos rotation3DEffect, con degrees para los angulos en grados y en axis para el eje le indicamos tanto la X, Y y Z
            .rotation3DEffect(
                .degrees(30),
                axis: (x: 1, y: 0, z: 0.0)
            )
            //2. Para darle sombra podemos indicarle el color, el radio y como opcional el obset con las ejes X e Y
            .shadow(color: .gray, radius: 3, x:0, y:30)
    }
}

#Preview {
    ContentView()
}
