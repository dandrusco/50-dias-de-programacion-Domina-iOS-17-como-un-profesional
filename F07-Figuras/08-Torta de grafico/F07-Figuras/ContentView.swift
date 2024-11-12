//
//  ContentView.swift
//  F07-Figuras
//
//  Created by Danilo Andrusco on 20-12-23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        //1. Crearemos una torta, para ello meteremos el Path en una ZStack
        ZStack {
            Path() { path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 100, startAngle: .degrees(0), endAngle: .degrees(200), clockwise: true)//2. Cambiaremos el endAngle a 200
            }
            .fill(.cyan)
            //3. Copiamos y pegamos el Path
            Path() { path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 100, startAngle: .degrees(200), endAngle: .degrees(120), clockwise: true) //4. El startAngle partira en 200 y el end en 120
            }
            //5. Cambiamos el color
            .fill(.yellow)
            
            //6. Hacemos lo  mismo, cambiamos el starAngle, endAndgle y el color
            Path() { path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 100, startAngle: .degrees(120), endAngle: .degrees(90), clockwise: true)
            }
            .fill(.red)
            
            //7. Agregamos uno mas..
            Path() { path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 100, startAngle: .degrees(90), endAngle: .degrees(0), clockwise: true)
            }
            .fill(.purple)
        }
    }
}

#Preview {
    ContentView()
}

