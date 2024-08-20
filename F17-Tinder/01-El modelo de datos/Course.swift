//
//  Course.swift
//  F17-Tinder
//
//  Created by Danilo Andrusco on 20-08-24.
//

import Foundation

//2. Crearemos su estructura con el nombre y la imagen del curso
struct Course {
    var name: String
    var image: String
}

//3. Crearemos la factoria a modo de desarrollo
#if DEBUG

var courses = [
    Course(name: "Curso de algebra lineal", image: "algebralineal"),
    Course(name: "Curso de calculo con Wolfram Alpha", image: "calculo"),
    Course(name: "Curso de estadistica descriptiva descriptiva", image: "descriptiva"),
    Course(name: "Curso de matematica discreta", image: "discreta"),
    Course(name: "Curso de estadistica inferencial", image: "inferencia"),
    Course(name: "Curso de iOS 10", image: "ios10"),
    Course(name: "Curso de iOS 11", image: "ios11"),
    Course(name: "Curso de iOS 12", image: "ios12"),
    Course(name: "Curso de Swift UI", image: "ios13"),
    Course(name: "Curso de Latex", image: "latex"),
    Course(name: "Curso de Probabilidad", image: "probabilidad"),
    Course(name: "Curso de Sage", image: "sage"),
    Course(name: "Aprueba las matematicas de selectividad", image: "selectividad"),
    Course(name: "Curso de Swift 5", image: "swift5")

]
#endif

