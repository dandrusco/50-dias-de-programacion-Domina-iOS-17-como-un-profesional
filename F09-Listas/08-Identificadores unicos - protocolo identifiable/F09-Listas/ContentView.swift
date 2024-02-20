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
        //1.Lo dejaremos como Latex y nos vamos al Course
        Course(name: "Latex", image: "latex"),
        Course(name: "Sage", image: "sage"),
        Course(name: "selectividad", image: "selectividad"),
        Course(name: "Swift 5", image: "swift5"),
        Course(name: "Curso de iOS 10", image: "ios10"),
        Course(name: "Curso de iOS 11", image: "ios11"),
        Course(name: "Curso de iOS 12", image: "ios12"),
        Course(name: "Curso de Swift UI con iOS 13", image: "ios13")
    ]
    
    var body: some View {
        //4. Por lo tanto ahora podemos presendir del id
        List(courses) { course in
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

