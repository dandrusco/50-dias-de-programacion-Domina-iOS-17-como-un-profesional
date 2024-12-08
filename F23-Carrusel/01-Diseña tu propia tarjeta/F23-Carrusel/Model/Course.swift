//
//  Course.swift
//  F23-Carrusel
//
//  Created by Danilo Andrusco on 08-12-24.
//

import Foundation

//8. Creamos una estructura para los cursos, donde solo trndra el ID, titulo e imagen
struct Course: Identifiable {
    var id = UUID()
    var title: String
    var image: String
}

//9. Creamos el DEBUG
#if DEBUG

//10. Creamos el arrays de curso
let courses = [ Course(title: "Curso de Álgebra Lineal", image: "algebralineal"),
                Course(title: "Curso de Cálculo en una Variable", image: "calculo"),
                Course(title: "Curso de Estadística Descriptiva", image: "descriptiva"),
                Course(title: "Curso de Matemática Discreta", image: "discreta"),
                Course(title: "Curso de Estadística Inferencial", image: "inferencia"),
                Course(title: "Curso Completo de Desarrollo de Apps para iOS 10", image: "ios10"),
                Course(title: "Curso Completo de Desarrollo de Apps para iOS 11", image: "ios11"),
                Course(title: "Curso Completo de Desarrollo de Apps para iOS 12", image: "ios12"),
                Course(title: "Curso Completo de Swift UI para iOS 13", image: "ios13")
]
//11. Cerramos el DEBUG y nos vamos a la Cardview
#endif
