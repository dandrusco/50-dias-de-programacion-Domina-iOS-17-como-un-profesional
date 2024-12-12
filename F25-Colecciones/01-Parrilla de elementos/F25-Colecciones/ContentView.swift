//
//  ContentView.swift
//  F25-Colecciones
//
//  Created by Danilo Andrusco on 12-12-24.
//

import SwiftUI

struct ContentView: View {
    
    //1. Vamos a crear una lista con nombres de iconos de los SF Symbols
    private var elements = ["highlighter", "paperplane", "desktopcomputer", "headphones", "video", "mic", "printer", "tv", "hifispeaker", "opticaldiscdrive"]
    
    //2.Creamos un arrays con 3 colores
    private var colors : [Color] = [
        .yellow, .teal, .purple
    ]
    
    //3. Vamos a crear un arrays de GridItem quien describira como queremos que sean las columnas, en este c caso pondremos dos
    private var layout = [
        //4.La primera columna sera fija .fixed de 100 puntos
        GridItem(.fixed(100)),
        //5. Utilizaremos la segunda que sea .adaptive configurando el minimo y maximo numero de pixeles por elementos
        GridItem(.adaptive(minimum: 50, maximum: 200))
    ]
    
    var body: some View {
        //6. pondremos una ScrollView horizontal
        ScrollView(.horizontal){
            //7. Cuando ya tenemos el layaut de GridItem, podemos utlilizar el LazyHGrid para horizontal o LazyVGrid en vertical, para crear la parrilla, como primer parametro le debemos pasar el layaut seguido de un espaciado de 24 puntos
            LazyHGrid(rows: self.layout, spacing: 24){
                //8. Creamos un ForEach para recorrer muchos elementons, pasandole el propio self al id
                ForEach((0...999), id: \.self){
                    //9. Pintaremos las imagenes con $0 + % para que no se pase del arrays
                    Image(systemName: self.elements[$0%self.elements.count])
                        .font(.system(size: 35))
                        //10. Configuramos el frame dejando el maxHeight infinito
                        .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: .infinity)
                        //11. Para pintar tambien deberemos porner el %
                        .background(self.colors[$0%self.colors.count])
                        .cornerRadius(16)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
