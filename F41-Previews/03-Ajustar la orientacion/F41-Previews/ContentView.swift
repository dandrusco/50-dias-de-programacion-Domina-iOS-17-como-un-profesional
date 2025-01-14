//
//  ContentView.swift
//  F41-Previews
//
//  Created by Danilo Andrusco on 14-01-25.
//

import SwiftUI

struct ContentView: View {
    
    //1. Vamos a personalizar las preview para que no todas sean iguales, para ello crearemos una variable para el nombre del icono
    var imageName = "globe"
    
    var body: some View {
        VStack {
            //2. En vez de llamar a globe ahora llamamos a la variable y la agrandaremos con un font de tipo titulo
            Image(systemName: self.imageName)
                .font(.title)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

//8. Aprovechemos y cambiemos el nombre de New 2 a vertical
#Preview("Vertical"){
    //3. Ahora a cada contevtView le podemos agregar una imagen, esta sera de un iphone
    ContentView(imageName: "iphone")
}

//6. Si queremos que la preview del ipad este en horizontal se lo pasamos por parametro a la misma Preview con el traits. aprovecharemos de cambiarle el nombre de New 2 a horizontal
#Preview("Horizontal", traits: .landscapeLeft) {
    //4. la New 2 sera un ipad
    ContentView(imageName: "ipad")
}
//7. Si ahora seleccionamos la preview llamada Horizontal, vemos que el dispositivo se vuelve horizontal

struct ContentViewOld: PreviewProvider{
    static var previews: some View {
        Group{
            //5. Al grupo le pondremos un macbook y al 2 un monitor
            Group{
                ContentView(imageName: "macbook")
                    .previewDisplayName("Old 1")
                
                ContentView(imageName: "desktopcomputer")
                    .previewDisplayName("Old 2")
            }
        }
    }
}
