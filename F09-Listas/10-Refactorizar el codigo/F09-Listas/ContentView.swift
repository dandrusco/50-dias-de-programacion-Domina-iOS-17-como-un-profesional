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
        List(courses) { course in
            //3. COmentaremso esta
            /*SimpleImageRow(course: course)*/
            //4. Llamaremso a la nueva
            FullImageRow(course: course)
            //10.Ahora si queremos alternar entre los dos simplemente deberemos ir cambiando de FullImageRow a SimpleImageRow
        }
        .listStyle(.plain)
    }
}

#Preview {
    ContentView()
}

//1. Copiaremos esta estructura y la pegaremos abajo del todo
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

//2. Le cambiaremso el nombre
struct FullImageRow: View {
    
    var course: Course
    
    var body: some View {
        //5. Le cambiaremos la HStack por una ZStack
        ZStack{
            Image(course.image)
                .resizable()
                //6. Cambiaremos el .scaledToFill() por .aspectRatio(contentMode: .fill) que es basicamente lo mismo
                .aspectRatio(contentMode: .fill)
                //7. Solo lo dejaremos con una altura de 150
                .frame(height: 150)
                .cornerRadius(25)
                //8. Crearemos un Overlay para el texto
                .overlay(
                    Rectangle()
                        .foregroundStyle(.gray)
                        .cornerRadius(25)
                        .opacity(0.3))
            
            Text(course.name)
                //9. Modificaremso la fuente
                .font(.system(.title, design: .rounded))
                .bold()
                .foregroundStyle(.white)
        }
    }
}
