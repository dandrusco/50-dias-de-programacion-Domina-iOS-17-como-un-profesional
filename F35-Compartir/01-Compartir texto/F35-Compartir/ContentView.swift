//
//  ContentView.swift
//  F35-Compartir
//
//  Created by Danilo Andrusco on 08-01-25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack() {
            //1. Para crear el boton de comprartir tenemos a ShareLink el cual le pasaremos el texto
            ShareLink(item: "Mira el curso de ioS 17")
            //2. Si le damos en el boton vemos que nos aparece este texto
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
