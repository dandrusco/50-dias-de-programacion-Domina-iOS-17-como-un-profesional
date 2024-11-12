//
//  ContentView.swift
//  F04-ScrollViews
//
//  Created by Danilo Andrusco on 04-12-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //2. A medida que fuimos ingresando cada tarjeta vimo como la imagen se fue haciendo cada vez mas pequeña hasta el punto de desaparecer, esto sucede por que no tenemos una vista scrolleable, para ello utilizaremos una ScrollView que meteremos toda la VStack
        ScrollView {
            VStack {
                //1. Eliminaremos la imagen, texto y padding que trae por defecto y en su lugar pondremos uina CardView
                CardView(image: "swift5", title: "Curso de Swift 5", description: "Aprende el lenguaje de programacion de Apple desde cero", level: "Nivel facil")
                
                CardView(image: "ios10", title: "Curso de iOS 10", description: "Crea tus primeras apps con iOS 10 y Swift", level: "Nivel medio")
                
                CardView(image: "ios11", title: "Curso de iOS 11", description: "Crea tus primeras apps con iOS 11 y Swift", level: "Nivel medio")
                
                CardView(image: "ios12", title: "Curso de iOS 12", description: "Crea tus primeras apps con iOS 12 y Swift", level: "Nivel medio")
                
                CardView(image: "ios13", title: "Curso de SwiftUI e iOS 13", description: "Crea tus primeras apps con iOS 13 y Swift UI", level: "Nivel facil")
                
            }
        }
    }
}

#Preview {
    ContentView()
}
