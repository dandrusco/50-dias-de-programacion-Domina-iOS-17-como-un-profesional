//
//  ContentView.swift
//  F07-Figuras
//
//  Created by Danilo Andrusco on 20-12-23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        //1. Swift nos trae algunas formas por defecto, para ello meteremos este boton en una VStack
        VStack {
            Button(action: {
                //TODO: implementar la accion del boton
            }, label: {
                Text("Prueba")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .frame(width: 300, height: 80)
                    .background(RectangleOvalShape().fill(Color.teal))
            })
            //2. Podemos crear un circulo con Circle
            Circle()
                .foregroundStyle(.red)
                .frame(width: 300, height: 300)
                //3. Le pintaremos otra figura en su interior con bordes redondeados
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 100, height: 100)
                        .foregroundStyle(.white)
                )
        }
    }
}

struct RectangleOvalShape: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint(x: rect.width/2, y: -0.15*rect.size.width))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        
        return path
    }
}

#Preview {
    ContentView()
}

