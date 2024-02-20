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
        //1. Podemos mezclar ambas estructura, para ello la lista de cursos llamaremos a su indice y en vez de pasarselos a course, se los pasaremos al idx
        //5. Nos esta dando una advertencia ya que al llamar a los indices ya no tengo acceso al identificador UUID, por o tanto le diremos que el ID somos nosotros mismos con \.self
        List(courses.indices, id: \.self) { idx in
            //2. Ahora podemos comprobar si la coleccion 0, 1 y 2 contiene el indice
            if (0...2).contains(idx){
                //3. Entonces utlizamos esta la Full version, pero como ya no tenemos cuorse se la deberemos pasar a courses en la pisicion IDX
                FullImageRow(course: courses[idx])
            }
            //4. Sino sera con ela vista simple
            else {
                SimpleImageRow(course: courses[idx])
            }
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
