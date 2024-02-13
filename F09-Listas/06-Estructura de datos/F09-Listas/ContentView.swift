//
//  ContentView.swift
//  F09-Listas
//
//  Created by Danilo Andrusco on 13-02-24.
//

//1. Crearemos un fichero de Swift y lo llamaremos Course

import SwiftUI

struct ContentView: View {
    
    //3. Crearemos un Arrays de Courses
    var courses = [
        //4. Ahora llamaremos al Course que creamos en el nuevo archvo (paso 1) y nos exige indicarle un nombre y una imagen, lo ingresaremos manualmente
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
    
    //5. Podemos eliminar tanto var courseNames como var courseImages ya que no las utilizaremos
    /*var courseNames = [
        "Curso de Swift UI con iOS 13"
    ]
    
    var courseImages = [
        "ios13"
    ]*/
    
    var body: some View {
        //6. La ventaja es que ya no tenemos que iterar sobre courseNames.indices sino que solo con courses y le cambiaremos el idx por course
        //9. AHora el compilador se nos queja ya que ahora tenemos un objeto, por lo tanto deberemos pasarle una propiedad y no un .self, por ejmplo el nombre (los nombres no se pueden repetir)
        List(courses, id: \.name) { course in
            HStack{
                //7. En la imagen en vez de iterar en courseImages[idx], ahora llamaos a course.image
                Image(course.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)
                
                //8. Lo mismo con el texto
                Text(course.name)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    ContentView()
}

