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
            .offset(x:-8, y: 30)
            
            //1. Podemos destacar mas aun el path, para ello lo meteremos en un ZStack
            ZStack {
                Path() { path in
                    path.move(to: CGPoint(x: 200, y: 200))
                    path.addArc(center: .init(x: 200, y: 200), radius: 100, startAngle: .degrees(90), endAngle: .degrees(0), clockwise: true)
                    path.closeSubpath()
                }
                .fill(.purple)
                .overlay(
                    Text("25%")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .offset(x: 50, y: -140)
            )
                //2. Copiaremos y pegamos el mismo path
                Path() { path in
                    path.move(to: CGPoint(x: 200, y: 200))
                    path.addArc(center: .init(x: 200, y: 200), radius: 100, startAngle: .degrees(90), endAngle: .degrees(0), clockwise: true)
                    path.closeSubpath()
                }
                //3. Cambiamos el fill por stroke de color negro y linea 4
                .stroke(.black, lineWidth: 4)
            }
        }
    }
}

#Preview {
    ContentView()
}

