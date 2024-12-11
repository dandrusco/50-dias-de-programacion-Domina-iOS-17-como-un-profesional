//
//  ContentView.swift
//  F24-Desplegables
//
//  Created by Danilo Andrusco on 11-12-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1. A la lista le pasaremos los menus hijos: , children: \.submenuitems
        List(learningPaths, children: \.submenuitems){ item in
            //2. Ahora podemos abrir cada uno de los menu padres y mostrara los menus hijos
            HStack{
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 40)
                Text(item.name)
                    .font(.system(.subheadline))
                    .fontWeight(.heavy)
            }
        }
        //3. Podemos agregar un listStyle para jugar con el diseño
        .listStyle(.grouped)
    }
}

#Preview {
    ContentView()
}
