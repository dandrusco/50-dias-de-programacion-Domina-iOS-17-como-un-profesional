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
            //1. Refactorizar el codigo nos sirvw para poder escalarlo aun mas, por ejemplo: podemos tomar esta HStack y crear una estructura, le damos boton derecho y le damos en Extract Subview
            //5. Ahora nos da error en SimpleImageRow(), pues debemos pasarle el curso que nosotros obtenemos de la iteracion
            SimpleImageRow(course: course)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ContentView()
}

//2. Le damos boton derecho en el nombre de la estructura, ledamos en Refactor y Rename para cambiarle el nombre
struct SimpleImageRow: View {
    
    //4. Pasra solucionarlo crearemos una variable de tipo Course
    var course: Course
    
    var body: some View {
        HStack{
            //3. Vemos que nos da un error ya que ahora no sabe que es course
            Image(course.image)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(25)
            
            Text(course.name)
        }
    }
}
