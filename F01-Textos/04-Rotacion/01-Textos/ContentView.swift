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
            //1. Para rotar en grados, por defecto el angulo de rotacion ocurre desde el centro, si lo queremos cambiar utilizaremos anchor con UnitPoint pasandole la X y la Y (desde el 0 al 1)
            .rotationEffect(.degrees(30), anchor: UnitPoint(x: 0.3, y: 0))
    }
}

#Preview {
    ContentView()
}
