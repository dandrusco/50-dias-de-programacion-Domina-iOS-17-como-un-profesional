//
//  ContentView.swift
//  F41-Previews
//
//  Created by Danilo Andrusco on 14-01-25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

//1. Podemos asignarles un nombre a la preview para que sea mas facil identificar, esto se hace entre parentesis
#Preview("New 1"){
    ContentView()
}

//6. En el caso de la nueva preview no hay grupos, siemplemente debemos ir creando una bajo la otra:
#Preview("New 2"){
    ContentView()
}

struct ContentViewOld: PreviewProvider{
    //2. Si se fijan dice previews en plural, esto es asi ya que se pueden crear grupos de previews
    static var previews: some View {
        //3. Creamos el grupo con dos ContentView
        Group{
            ContentView()
                //4. COmo podemos apreciar ambar se llama iguales, con previewDisplayName le podemos asingar un nombre
                .previewDisplayName("Old 1")
            
            ContentView()
                //5. Le asignamos el segundo nombre
                .previewDisplayName("Old 2")
        }
    }
}
