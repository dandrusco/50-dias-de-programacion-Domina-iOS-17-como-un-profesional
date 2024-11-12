//
//  ContentView.swift
//  F07-Figuras
//
//  Created by Danilo Andrusco on 20-12-23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Path() { path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 100, startAngle: .degrees(0), endAngle: .degrees(200), clockwise: true)
            }
            .fill(.cyan)

            Path() { path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 100, startAngle: .degrees(200), endAngle: .degrees(120), clockwise: true)
            }
            .fill(.yellow)
            
            Path() { path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 100, startAngle: .degrees(120), endAngle: .degrees(90), clockwise: true)
            }
            .fill(.red)
            //1. Podemos destacar la torta de color rojo con un offset
            .offset(x:-8, y: 30)
            
            Path() { path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 100, startAngle: .degrees(90), endAngle: .degrees(0), clockwise: true)
                //2. Hasta el momento no hemos cerrado el path, asi que lo cerraremos
                path.closeSubpath()
            }
            .fill(.purple)
            //3. Crearemos un overlay para inscrustar un 25% en formato de texto
            .overlay(
                Text("25%")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .offset(x: 50, y: -140)
            )
        }
    }
}

#Preview {
    ContentView()
}

