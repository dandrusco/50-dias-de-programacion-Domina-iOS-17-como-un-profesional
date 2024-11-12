//
//  ContentView.swift
//  F09-Listas
//
//  Created by Danilo Andrusco on 13-02-24.
//

import SwiftUI

struct ContentView: View {
    //1. Crearemos 2 variables, una para los nombres de los cursos y la otra para la imagenes de los cursos
    var courseNames = [
        "Algebra Lineal",
        "Calculo",
        "Estadistica Descriptiva",
        "Estadistica Inferencial",
        "Probabilidad",
        "Latex",
        "Sage",
        "Selectividad",
        "Swift 5",
        "Curso de iOS 10",
        "Curso de iOS 11",
        "Curso de iOS 12",
        "Curso de Swift UI con iOS 13"
    ]
    
    var courseImages = [
        "algebralineal",
        "calculo",
        "descriptiva",
        "inferencia",
        "discreta",
        "probabilidad",
        "latex",
        "sage",
        "selectividad",
        "swift5",
        "ios10",
        "ios11",
        "ios12",
        "ios13"
    ]
    
    
    var body: some View {
        //2. No vamos a recorrer del 1...5 sino qe los cursos con su indice, y los guardaremos en la variable idx
        List(courseNames.indices, id: \.self) { idx in
            //3. Sustituiremos el texto por una HStack
            /*Text("Elemento \($0)")*/
            HStack{
                //4. Ahora pondremos la imagen de acuerdo al indice
                Image(courseImages[idx])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)
                
                //5. Ahora pondremos el nombre del curso
                Text(courseNames[idx])
            }
        }
        //6. Le cambiaremos el estilo a la lista
        .listStyle(.plain)
    }
}

#Preview {
    ContentView()
}

