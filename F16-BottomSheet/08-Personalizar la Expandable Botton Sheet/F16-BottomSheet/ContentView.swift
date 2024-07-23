//
//  ContentView.swift
//  F09-Listas
//
//  Created by Danilo Andrusco on 13-02-24.
//

import SwiftUI

struct ContentView: View {
    
    //1. Declararemos una variable de estado para lanzar la Expandable Botton Shhet como opcional
    @State private var selectedCourse: Course?
    var body: some View {
        NavigationStack{
            List{
                ForEach(CourseFactory().courses) { course in
                    SimpleImageRow(course: course)
                    //2. Añadiremos un OnTapGesture para ver si hemos tocado un curso
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
        //3. Deberemos invocar a .sheet, para presentar en el item el selectedCourse
        .sheet(item: self.$selectedCourse){ course in
            //4. El course que mostrara sera el de la CourseDetailView
            CourseDetailView(course: course)
            //5. Ignoraremos la zona segura
                .ignoresSafeArea()
            //6. Definiremos el presentationDetents, pasandole el array de tamaño medio y tamaño largo
                .presentationDetents([.medium, .large])
            //7. Probaremos abriendo los cursos, como unica salvedad vemos que tenemos dos barrita de cierre (hanble bar), para ello lo eliminaremos, pero antes en la Course DetalView le cambiaremos el color
            //9. AHora si lo eliminaremos (ocultamos)
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
