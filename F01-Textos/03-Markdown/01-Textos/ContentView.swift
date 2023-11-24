//
//  ContentView.swift
//  01-Textos
//
//  Created by Danilo Andrusco on 23-11-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //2. Para que queden en negrita utilizamos los 2 **, cursiva con 1 *, tambien un link a un sitio web encerrando el texto con corchetes y entre parentesis el vinculo
        Text("**Esto es un texto en negrita.** *Esto es un texto en cursiva* Podemos añadir un [link a un sitio web](http://www.tectroya.cl)")
            //1. Swift soporta Markdown, por lo tanto sacaremos las letras de sistema y el negrito
            /*.fontWeight(.bold)
            .font(.system(size: 25, design: .rounded))*/
            .foregroundStyle(.purple)
            .multilineTextAlignment(.center)
            .lineLimit(3)
            .truncationMode(.head)
            .lineSpacing(12)
            .padding(40)
    }
}

#Preview {
    ContentView()
}
