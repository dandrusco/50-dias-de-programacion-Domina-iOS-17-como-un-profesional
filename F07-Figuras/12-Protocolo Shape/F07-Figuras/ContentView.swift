//
//  ContentView.swift
//  F07-Figuras
//
//  Created by Danilo Andrusco on 20-12-23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        //6. Eliminaremos este path
        /*Path() { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addQuadCurve(to: CGPoint(x: 250, y: 0), control: CGPoint(x: 125, y: -25))
            path.addRect(CGRect(x: 0, y: 0, width: 250, height: 60))
        }
        .fill(.teal)*/
        
        //7. Crearemos un boton con este diseño
        Button(action: {
            //TODO: implementar la accion del boton
        }, label: {
            Text("Prueba")
                .font(.system(.title, design: .rounded))
                .bold()
                .foregroundStyle(.white)
                //8. Tamaño del boton
                .frame(width: 300, height: 80)
                //9. En vez de darle un Color, le pasamos el diseño RectangleOvalShape, seguido del fill con el color a eleccion
                .background(RectangleOvalShape().fill(Color.teal))
        })
    }
}

//1. Crearemos una estructura para este diseño, la estructura debe ser del protocolo Shape
struct RectangleOvalShape: Shape{
    //2. Al ser del protocolo shape, debe contener una funcion path in rect
    func path(in rect: CGRect) -> Path {
        //3. Declaramos la la variable path para dibujar
        var path = Path()
        //4. Copiaremos el mismo dibujo anterior, pero en vez de utilizar cifras absolutas, vamos a utilizar el tamaño que le vamos a pasar en el rect: CGRect
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint(x: rect.width/2, y: -0.15*rect.size.width))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        
        //5. deberemos devolver el path
        return path
    }
}

#Preview {
    ContentView()
}

