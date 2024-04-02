//
//  ContentView.swift
//  F12-Formularios
//
//  Created by Danilo Andrusco on 02-04-24.
//

//1. Tomaremos el codigo de F09-Listas
//2. Para poder filtrar necesitaremos irnos a Course

import SwiftUI

struct ContentView: View {
    
    var courses = [
        //4. Deberemnos agregar el precio a cada uno de los cursos
        Course(name: "Álgebra Lineal", image: "algebralineal", author: "María Santos", difficulty: 1, description: "Curso para iniciarse en el mundo del álgebra lineal", price: 19.99),
        Course(name: "Cálculo", image: "calculo", author: "Arnau Mir y Llorenç Valverde", difficulty: 2, description: "Descubre todo el mundo del cálculo en una variable y practica con Wolfram Alpha y Python", price: 24.99),
        Course(name: "Estadística Descriptiva", image: "descriptiva", author: "María Santos y Juan Gabriel", difficulty: 2, description: "Descubre la Estadística Descriptiva con R y Python", price: 18.99),
        Course(name: "Estadística Inferencial", image: "inferencia", author: "Ricardo Alberich y Arnau Mir", difficulty: 3, description: "Descubre el poder de la inferencia estadística implementando tus tests con R", price: 29.99),
        Course(name: "Matemática Discreta", image: "discreta", author: "Juan Gabriel Gomila", difficulty: 2, description: "Piensa como todo un matemático con los ejerciicos prácticos", price: 14.99),
        Course(name: "Probabilidad", image: "probabilidad", author: "Arnau Mir y  Ricardo Alberich", difficulty: 3, description: "Resuelve problemas de probabilidad y variables aleatoria desde cero y sin experiencia previa", price: 27.99),
        Course(name: "Curso de Latex", image: "latex", author: "Llorenç Valverde y Juan Gabriel Gomila", difficulty: 1, description: "Redacta documentos profesionales gracias al poder de LaTeX", price: 14.99),
        Course(name: "Curso de Sage", image: "sage", author: "Llorenç Valverde y Juan Gabriel Gomila", difficulty: 1, description: "Aprovecha el poder de Sage para resolver problemas matemáticos sin esfuerzo", price: 13.99),
        Course(name: "Prepara la Selectividad", image: "selectividad", author: "María Santos", difficulty: 2, description: "Más de 100 ejercicios resueltos de matemáticas de bachillerato para preparar tu examen de selectividad", price: 22.99),
        Course(name: "Curso de Swift 5 desde cero", image: "swift5", author: "Juan Gabriel Gomila", difficulty: 1, description: "Aprende a programar con el lenguaje oficial para crear apps para dispositivos de iOS", price: 34.99),
        Course(name: "Curso de iOS 10", image: "ios10", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple", price: 39.99),
        Course(name: "Curso de iOS 11", image: "ios11", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple", price: 39.99),
        Course(name: "Curso de iOS 12", image: "ios12", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple", price: 39.99),
        Course(name: "Curso de Swift UI con iOS 13", image: "ios13", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple y el nuevo Framework de Swift UI", price: 29.99)
    ]
    //5. Tambien deberemos modificcar la CourseDetailView

    
    init(){
        let navbarApparance = UINavigationBarAppearance()
        
        navbarApparance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.systemTeal,
            .font : UIFont(name: "ArialRoundedMTBold", size: 30)!
        ]
        navbarApparance.titleTextAttributes = [
            .foregroundColor: UIColor.systemTeal,
            .font : UIFont(name: "ArialRoundedMTBold", size: 20)!
        ]
        
        UINavigationBar.appearance().standardAppearance = navbarApparance
        UINavigationBar.appearance().scrollEdgeAppearance = navbarApparance
        UINavigationBar.appearance().compactAppearance = navbarApparance
        
        navbarApparance.setBackIndicatorImage(UIImage(systemName: "arrow.uturn.backward"), transitionMaskImage: UIImage(systemName: "arrow.uturn.backward"))
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(courses) { course in
                    NavigationLink(destination: CourseDetailView(course: course)){
                        SimpleImageRow(course: course)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Cursos de Frogames")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .tint(.teal)
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

//7. Como solo utilizaremos la SimpleImageRow, eliminaremos la FullImageRow y la CourseRow
/*struct FullImageRow: View {
    
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

struct CourseRow: View {
    
    var course: Course
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .cornerRadius(25)
            
            Text(course.name)
                .font(.system(.title, design: .rounded))
                .bold()
                .lineLimit(1)
                .padding(.bottom, 2)
            
            
            Text("Creado por \(course.author)".uppercased())
                .font(.system(.subheadline, design: .rounded))
                .foregroundStyle(.secondary)
                .lineLimit(2)
                .padding(.bottom, 2)
            
            HStack(spacing: 6){
                ForEach(1...(course.difficulty), id: \.self){ _ in
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundStyle(.teal)
                }
            }
            
            Text(course.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(3)
        }
    }
}*/
