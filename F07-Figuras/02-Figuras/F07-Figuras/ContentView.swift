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
            //1. Podemos pintar otra linea
            path.addLine(to: CGPoint(x:350, y: 220))
            //2. le añadiremos dos lineas mas para cerrar el grafico
            path.addLine(to: CGPoint(x:50, y: 220))
            //5. Si queremos obiar las cordenadas para cerrar el rectangulo pordemos llamar a un metodo de4l path llamado closeSubpath
            /*path.addLine(to: CGPoint(x:50, y: 50))*/
            path.closeSubpath()
        }
        //3. Ahora cambiaremnos el stroke por el fill para pintarlo completamente
        .fill(.cyan)
        //4. Si no le indicamos nada (Ni Stroke ni Fill) lo rellebara de color negro por defecto
    }
}

#Preview {
    ContentView()
}
