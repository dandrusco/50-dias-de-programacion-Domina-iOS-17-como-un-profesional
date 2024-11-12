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
            //1. Meteremos aqui dos lineas mas
            path.addLine(to: CGPoint(x:300, y: 200))
            path.addLine(to: CGPoint(x:100, y: 200))

            
            path.addLine(to: CGPoint(x:50, y: 220))
            path.closeSubpath()
        }
        .fill(.cyan)
    }
}

#Preview {
    ContentView()
}
