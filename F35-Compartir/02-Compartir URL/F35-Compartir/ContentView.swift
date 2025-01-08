//
//  ContentView.swift
//  F35-Compartir
//
//  Created by Danilo Andrusco on 08-01-25.
//

import SwiftUI

struct ContentView: View {
    
    //1. Para poder compartir necesitaremos una URl, asi que la crearemos como una constante privada, le meteremos un ! para asegurarnos que siempre tendra una URL
    private let url = URL(string: "https://cursos.frogamesformacion.com/pages/blog")!
    
    var body: some View {
        VStack() {
            //2. Para crear el boton de comprartir tenemos a ShareLink el cual le pasaremos la variable creada 
            ShareLink(item: url)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
