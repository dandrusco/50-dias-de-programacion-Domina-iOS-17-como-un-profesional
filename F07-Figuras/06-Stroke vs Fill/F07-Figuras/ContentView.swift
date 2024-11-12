//
//  ContentView.swift
//  F07-Figuras
//
//  Created by Danilo Andrusco on 20-12-23.
//

import SwiftUI

struct ContentView: View {
    var start = CGPoint(x:300, y: 200)
    //2. Cambiaremos la Y a 120
    var control = CGPoint(x:200, y: 120)
    var end = CGPoint(x:100, y: 200)
    
    var drawTriangle = true
    
    var body: some View {
        //3. Para lograrlo meteremos este path en una ZStack
        ZStack {
            Path() { path in
                path.move(to: CGPoint(x: 50, y: 50))
                path.addLine(to: CGPoint(x:350, y: 50))
                path.addLine(to: CGPoint(x:350, y: 220))
                path.addLine(to: start)
                path.addQuadCurve(to: end, control: control)
                
                if (drawTriangle){
                    path.addLine(to: start)
                    path.addLine(to: control)
                    path.addLine(to: end)
                }
                path.addLine(to: CGPoint(x:50, y: 220))
                path.closeSubpath()
            }
            //1. No podemos utilizar al mismo tiempo el fill con el stroke, en este ejemplo el stroke lo cambiaremos a fill y lo pintaremos verde
            .fill(.green)
            
            //4. Copiaremos el Path y lo pegaremos aqui
            Path() { path in
                path.move(to: CGPoint(x: 50, y: 50))
                path.addLine(to: CGPoint(x:350, y: 50))
                path.addLine(to: CGPoint(x:350, y: 220))
                path.addLine(to: start)
                path.addQuadCurve(to: end, control: control)
                
                if (drawTriangle){
                    path.addLine(to: start)
                    path.addLine(to: control)
                    path.addLine(to: end)
                }
                path.addLine(to: CGPoint(x:50, y: 220))
                path.closeSubpath()
            }
            //5. Cambiamos el fill por stroke de color cyan con un grosor 6
            .stroke(.cyan, lineWidth: 6)
            
            //6. El primer path se rellena de color verde y el segundo se pinta los bordes de color cyan
           
        }
    }
}

#Preview {
    ContentView()
}

