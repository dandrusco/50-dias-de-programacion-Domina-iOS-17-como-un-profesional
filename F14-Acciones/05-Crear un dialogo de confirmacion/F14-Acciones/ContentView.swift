//
//  ContentView.swift
//  F09-Listas
//
//  Created by Juan Gabriel Gomila Salas on 21/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var courses = [
        Course(name: "Álgebra Lineal", image: "algebralineal", author: "María Santos", difficulty: 1, description: "Curso para iniciarse en el mundo del álgebra lineal"),
        Course(name: "Cálculo", image: "calculo", author: "Arnau Mir y Llorenç Valverde", difficulty: 2, description: "Descubre todo el mundo del cálculo en una variable y practica con Wolfram Alpha y Python"),
        Course(name: "Estadística Descriptiva", image: "descriptiva", author: "María Santos y Juan Gabriel", difficulty: 2, description: "Descubre la Estadística Descriptiva con R y Python"),
        Course(name: "Estadística Inferencial", image: "inferencia", author: "Ricardo Alberich y Arnau Mir", difficulty: 3, description: "Descubre el poder de la inferencia estadística implementando tus tests con R"),
        Course(name: "Matemática Discreta", image: "discreta", author: "Juan Gabriel Gomila", difficulty: 2, description: "Piensa como todo un matemático con los ejerciicos prácticos"),
        Course(name: "Probabilidad", image: "probabilidad", author: "Arnau Mir y  Ricardo Alberich", difficulty: 3, description: "Resuelve problemas de probabilidad y variables aleatoria desde cero y sin experiencia previa"),
        Course(name: "Curso de Latex", image: "latex", author: "Llorenç Valverde y Juan Gabriel Gomila", difficulty: 1, description: "Redacta documentos profesionales gracias al poder de LaTeX"),
        Course(name: "Curso de Sage", image: "sage", author: "Llorenç Valverde y Juan Gabriel Gomila", difficulty: 1, description: "Aprovecha el poder de Sage para resolver problemas matemáticos sin esfuerzo"),
        Course(name: "Prepara la Selectividad", image: "selectividad", author: "María Santos", difficulty: 2, description: "Más de 100 ejercicios resueltos de matemáticas de bachillerato para preparar tu examen de selectividad"),
        Course(name: "Curso de Swift 5 desde cero", image: "swift5", author: "Juan Gabriel Gomila", difficulty: 1, description: "Aprende a programar con el lenguaje oficial para crear apps para dispositivos de iOS"),
        Course(name: "Curso de iOS 10", image: "ios10", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple"),
        Course(name: "Curso de iOS 11", image: "ios11", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple"),
        Course(name: "Curso de iOS 12", image: "ios12", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple"),
        Course(name: "Curso de Swift UI con iOS 13", image: "ios13", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple y el nuevo Framework de Swift UI")
    ]

    //1. Crearemos dos estados, uno para crear un dialogo de confirmacion, en principio estara en falso y un selector de curso de tipo cursos pero opcional ya que esta podria ser nula
    @State private var showDialog = false
    @State private var selectedCourse: Course?
    
    var body: some View {
        List{
            ForEach(self.courses){ course in
                SimpleImageRow(course: course)
                    .contextMenu {
                        Button(action: {
                            self.delete(course: course)
                        }, label: {
                            HStack {
                                Text("Eliminar")
                                Image(systemName: "trash")
                            }
                        })
                        
                        Button(action: {
                            self.setFavorite(course: course)
                        }, label: {
                            HStack{
                                Text(course.isFavorite ? "Eliminar favorito" : "Favorito")
                                Image(systemName: "star")
                            }
                        })
                    }
                    //2. Crearemos un onTapGesture para pasar de false a true cada vez que el usuario lo cliquee
                    .onTapGesture {
                        self.showDialog.toggle()
                        //3. Por lo tanto tambien le pasaremos el curso seleccionado
                        self.selectedCourse = course
                    }
                    //4. A continuacion crearemos el dialofo con confirmationDialogo, deberemos pasarle un titulo, el segundo parametro es el isPresented donde debemos pasarle una variable booleana y en la accion pondremos un boton
                    .confirmationDialog("Selecciona la accion a realizar", isPresented: self.$showDialog){
                        Button {
                            //7. Como la variable selectedCoruse es opcional pero los metodos de borrar o favorito requieren un curso que no puede ser nulo, por lo tanto deberemos realizar un casting seguro. Por lo tanto si conseguimos sacar el valor y ese valor no es nulo, le pasamos el curso a setFavorito
                            if let selectedCourse = self.selectedCourse{
                                self.setFavorite(course: selectedCourse)
                                
                            }
                        } label: {
                            Text("Marcar como favorito")
                        }
                        //5. Crearemos un segundo boton pero esta vez lo definiremos con un rol que es destructivo
                        Button ("Eliminar curso", role: .destructive) {
                            //8. Lo mimso para eliminar el curso
                            if let selectedCourse = self.selectedCourse{
                                self.delete(course: selectedCourse)
                            }
                        }
                        //6. Pondremos un tercer boton con rol de cancelar
                        Button ("Cancelar", role: .cancel) {
                            //9. en cancelar como nuestro es objetivo es mostrar la confirmationDialog cuando la variable showDialog pasa a ser True, deberemos pasarla a false
                            self.showDialog = false
                        }
                    }
            }
            .onDelete{ (indexSet) in
                self.courses.remove(atOffsets: indexSet)
            }
        }
        .listStyle(.insetGrouped)
    }
    private func delete(course: Course) {
        if let index = self.courses.firstIndex(where: { $0.id == course.id}){
            self.courses.remove(at: index)
        }
    }
    
    private func setFavorite(course: Course) {
        if let index = self.courses.firstIndex(where: { $0.id == course.id}){
            self.courses[index].isFavorite.toggle()
        }
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
            
            if (course.isFavorite){
                Spacer()
                Image(systemName: "star.circle")
                    .foregroundStyle(.yellow)
            }
        }
    }
}
