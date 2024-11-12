//
//  ContentView.swift
//  F07-Figuras
//
//  Created by Danilo Andrusco on 20-12-23.
//

import SwiftUI

struct ContentView: View {
    //2. Podemos mejorar esto creando variables
    var start = CGPoint(x:300, y: 200)
    var control = CGPoint(x:200, y: 420)
    var end = CGPoint(x:100, y: 200)
    
    //3. Crearemos una variable booleana para dibujar o NO un triangulo
    var drawTriangle = true
    
    var body: some View {
        Path() { path in
            path.move(to: CGPoint(x: 50, y: 50))
            path.addLine(to: CGPoint(x:350, y: 50))
            path.addLine(to: CGPoint(x:350, y: 220))
            path.addLine(to: start)
            path.addQuadCurve(to: end, control: control)
            
            //4. Crearemos un if para ver si lo dibujamos o no:
            if (drawTriangle){
                //5. Agregar las lineas del triangulo
                path.addLine(to: start)
                path.addLine(to: control)
                path.addLine(to: end)
            }
            //5. Ahora podemos alternar entre true o false para ver si po dibujamos o no
            path.addLine(to: CGPoint(x:50, y: 220))
            path.closeSubpath()
        }
        //1. Cambairemos el fill por el stroke
        .stroke(.cyan)
    }
}

#Preview {
    ContentView()
}

