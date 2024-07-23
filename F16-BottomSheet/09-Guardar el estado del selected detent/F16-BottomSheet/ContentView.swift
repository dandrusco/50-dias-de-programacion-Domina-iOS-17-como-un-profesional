//
//  ContentView.swift
//  F09-Listas
//
//  Created by Danilo Andrusco on 13-02-24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedCourse: Course?
    
    //3. Que pasa si el usuario que abrirlo siempre en Medium? para ello crearemos una variable de estado para guardar esa preferencia del usuario
    @State private var selectedDetent: PresentationDetent = .medium
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(CourseFactory().courses) { course in
                    SimpleImageRow(course: course)
                        .onTapGesture {
                            self.selectedCourse = course
                        }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Cursos de Frogames")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .sheet(item: self.$selectedCourse){ course in
            CourseDetailView(course: course)
                .ignoresSafeArea()
            //4. Despues del .large compredos la seleccion
                //1. En vez de que solo tenga medio y largo, crearemos 2 mas, el primero sera fraction al 20% y el segundo de 250 puntos
                .presentationDetents([.fraction(0.2), .height(250), .medium, .large], selection: self.$selectedDetent)
                //2. Ahora podemos comprobar que al hacer clic en uno de los cursos tiene 4 tamaños.
                .presentationDragIndicator(.hidden)
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
