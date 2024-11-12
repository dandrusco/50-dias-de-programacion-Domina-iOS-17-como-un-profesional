//
//  ContentView.swift
//  F07-Figuras
//
//  Created by Danilo Andrusco on 20-12-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1. para pintar un rectangulo lo hacemos con Path para iniciar nuestro camino
        Path() { path in
            //2. Para pintar, lo moveremos a un punto en concreto (aun no lo hemos pintado)
            path.move(to: CGPoint(x: 50, y: 50))
            //3. Ahora dibujamos la linea al punto de destino
            path.addLine(to: CGPoint(x:350, y: 50))
        }
        //4. stroke lo pintamos de color cyan
        .stroke(.cyan)
    }
}

#Preview {
    ContentView()
}
