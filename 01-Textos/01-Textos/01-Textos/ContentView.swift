//
//  ContentView.swift
//  01-Textos
//
//  Created by Danilo Andrusco on 23-11-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1. Para escribir un texto utilizaremos Text
        Text("Hola Mundo!")
            //2. Agregaremos modificadores (comienzan con un punto)
            .fontWeight(.bold)//.bold es Negrita
            //3. Otra forma mas rapida es simplemente ponerle el .bold
            /*.bold()*/
        
            //4. Fuentes, podemos poner una fuente de titulo
            /*.font(.title)*/
        
            //5. Otra forma es atravez de la fuente del sistema que nos permite no solo poner la fuente de titulo, si no que tambien redondeada
            /*.font(.system(.title, design: .rounded))*/
        
            //6. EN vez de indicar la fuente de titulo, le podemos poner el tamaño que nosostros queramos
            .font(.system(size: 40, design: .rounded))
            //7. para cambiar el color
            .foregroundStyle(.purple)
    }
}

#Preview {
    ContentView()
}
