//
//  ContentView.swift
//  F07-Figuras
//
//  Created by Danilo Andrusco on 20-12-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Path() { path in
            path.move(to: CGPoint(x: 50, y: 50))
            path.addLine(to: CGPoint(x:350, y: 50))
            path.addLine(to: CGPoint(x:350, y: 220))
            path.addLine(to: CGPoint(x:300, y: 200))
            //1. Imaginemosno que en vez de que se marquen esos dos puntos queremos una curvatura, para ello utilizaremos addQuadCurve con las cordenaas utilizadas en la siguiente linea y el control sera el punto de control (que tan estirada es la curva)
            path.addQuadCurve(to: CGPoint(x: 100, y: 200), control: CGPoint(x: 200, y: 180))
            //2. Esta liena ahora esta demas
            /*path.addLine(to: CGPoint(x:100, y: 200))*/
            path.addLine(to: CGPoint(x:50, y: 220))
            path.closeSubpath()
        }
        .fill(.cyan)
    }
}

#Preview {
    ContentView()
}
