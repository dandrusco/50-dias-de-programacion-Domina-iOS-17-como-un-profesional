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
        //1. Para poder pintar las lineas separadoras deberemos sacar la lista y poner en su interior un ForEach
        List{
            ForEach(courses.indices, id: \.self) { idx in
                if (0...2).contains(idx){
                    FullImageRow(course: courses[idx])
                }
                else {
                    SimpleImageRow(course: courses[idx])
                }
            }
            //2. Para cambiar el tinte del separador de lineas utilizaremos el .listRowSeparatorTint y lo pintaremos de color teal
            .listRowSeparatorTint(.teal)
            //3. En cambio si lo que queremos es ocultar los separadores lo hacemos asi:
            .listRowSeparator(.hidden)
            //4. Obviamente al ponerlo invisible no tiene sentido pintarlos
        }
        .listStyle(.plain)
    }
}

#Preview {
    ContentView()
}

struct SimpleImageRow: View {
    
    var course: Course
    
    var body: some View {
        HStack{
            Image(course.image)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(25)
            
            Text(course.name)
        }
    }
}

struct FullImageRow: View {
    
    var course: Course
    
    var body: some View {
        ZStack{
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .cornerRadius(25)
                .overlay(
                    Rectangle()
                        .foregroundStyle(.gray)
                        .cornerRadius(25)
                        .opacity(0.3))
            
            Text(course.name)
                .font(.system(.title, design: .rounded))
                .bold()
                .foregroundStyle(.white)
        }
    }
}
