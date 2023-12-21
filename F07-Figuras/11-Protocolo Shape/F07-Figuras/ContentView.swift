//
//  ContentView.swift
//  F07-Figuras
//
//  Created by Danilo Andrusco on 20-12-23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        //1. Dibujaremos un rectangulo pero en la parte superior sera curbo
        Path() { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addQuadCurve(to: CGPoint(x: 250, y: 0), control: CGPoint(x: 125, y: -25))
            //2. Podemos utilizar addRect para añadir un rectangugo
            path.addRect(CGRect(x: 0, y: 0, width: 250, height: 60))
        }
        .fill(.teal)
    }
}

#Preview {
    ContentView()
}

