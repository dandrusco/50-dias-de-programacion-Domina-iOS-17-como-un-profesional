//
//  ContentView.swift
//  F41-Previews
//
//  Created by Danilo Andrusco on 14-01-25.
//

import SwiftUI

struct ContentView: View {
    
    var imageName = "globe"
    
    var body: some View {
        VStack {
            Image(systemName: self.imageName)
                .font(.title)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview("Vertical"){
    ContentView(imageName: "iphone")
}

#Preview("Horizontal", traits: .landscapeLeft) {
    ContentView(imageName: "ipad")
}

//1. Creamos otra preview pero esta vez con el parametro de traits llamado sizeThatFitsLayout que nos permite eliminar el dispositivo y solo nos muestra la pantalla, esto se logra si seleccionamos el segundo boton que aparece abajo en forma de cuadrado con un puntero del mouse
#Preview("Elimina el dispositivo", traits: .sizeThatFitsLayout){
    //2. Contendra un apple watch
    ContentView(imageName: "applewatch")
}

//3.Hay otro que es el fixedLayout el cual le podemos dar una altura y una anchura, tambien eliminando el dispositivo
#Preview("Fixed Layout", traits: .fixedLayout(width: 500, height: 250)){
    //4. tendra una imagen de un mouse
    ContentView(imageName: "magicmouse")
}

struct ContentViewOld: PreviewProvider{
    static var previews: some View {
        Group{
            Group{
                ContentView(imageName: "macbook")
                    .previewDisplayName("Old 1")
                
                ContentView(imageName: "desktopcomputer")
                    .previewDisplayName("Old 2")
            }
        }
    }
}
