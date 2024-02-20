//
//  ContentView.swift
//  F09-Listas
//
//  Created by Danilo Andrusco on 13-02-24.
//

import SwiftUI

struct ContentView: View {

    var courses = [
        Course(name: "Algebra Lineal", image: "algebralineal"),
        Course(name: "Calculo", image: "calculo"),
        Course(name: "Estadistica Descriptiva", image: "descriptiva"),
        Course(name: "Estadistica Inferencial", image: "inferencia"),
        Course(name: "Matematica Discreta", image: "discreta"),
        Course(name: "Probabilidad", image: "probabilidad"),
        //1. El name es una clave unica, si por ejemplo llamaos al curso de Latex como Probabilidad veremos que a pesar de que Latex tenga otra imagen, este mostrara la de Probabilidad
        Course(name: "Probabilidad", image: "latex"),
        Course(name: "Sage", image: "sage"),
        Course(name: "selectividad", image: "selectividad"),
        Course(name: "Swift 5", image: "swift5"),
        Course(name: "Curso de iOS 10", image: "ios10"),
        Course(name: "Curso de iOS 11", image: "ios11"),
        Course(name: "Curso de iOS 12", image: "ios12"),
        Course(name: "Curso de Swift UI con iOS 13", image: "ios13")
    ]
    
    var body: some View {
        //2. Esto ocurre ya que le dijimos que el name es el identificador unico, para solucionarlo deberemos ir a Course
        //4. Comentaremos esta linea
        /*List(courses, id: \.name) { course in */
        //5. Cambiaremos el .name por el .id y podemos ver que apesar que ahora extien dos probabilidades, esta respetan cada imagen
        List(courses, id: \.id) { course in
            HStack{
                Image(course.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)
                
                Text(course.name)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    ContentView()
}

