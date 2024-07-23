//
//  CourseDetailView.swift
//  F16-BottomSheet
//
//  Created by Danilo Andrusco on 28-05-24.
//

import SwiftUI

struct CourseDetailView: View {
    
    let course: Course
    
    var body: some View {
        VStack{
            HandleBar()
            TitleBar()
            HeaderView(courses: self.course)
            ScrollView(.vertical){
                DetailView(icon :"person.fill", info: self.course.author)
                DetailView(icon :"chart.bar.fill", info: "Dificultad \(self.course.difficulty)/4")
                DetailView(icon: nil, info: self.course.description)
                    .padding(.top)
                DetailView(icon: nil, info: "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor \n(N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. \n\nFue popularizado en los 60s con la creación de las hojas Letraset, las cuales contenian pasajes de Lorem Ipsum, \ny más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.")
            }
        }
        .background(.white)
        .cornerRadius(16, antialiased: true)
    }
}

struct HandleBar: View {
    var body: some View {
        Rectangle()
            .frame(width: 100, height: 8)
            //8. Cambiamos el color a Teal
            .foregroundStyle(.teal)
            .cornerRadius(16)
    }
}

struct TitleBar: View {
    var body: some View {
        HStack{
            Text("Detalles del curso")
                .font(.title2)
                .foregroundStyle(.primary)
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

struct HeaderView: View {
    
    let courses : Course
    var body: some View {
        Image(courses.image)
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.width)
            .overlay(
                HStack {
                    VStack(alignment: .leading){
                        Spacer()
                        Text(courses.name)
                            .foregroundStyle(.white)
                            .font(.system(.title, design: .rounded))
                            .bold()
                        Text(courses.path)
                            .font(.system(.subheadline, design: .rounded))
                            .padding(4)
                            .padding(.horizontal, 16)
                            .foregroundStyle(.white)
                            .background(Color.teal)
                            .cornerRadius(16)
                    }
                    Spacer()
                }
                    .padding(24)
            )
    }
}

struct DetailView: View {
    
    let icon: String?
    let info: String
    
    var body: some View {
        HStack {
            if (self.icon != nil){
                Image(systemName: icon!)
                    .padding(.trailing, 10)
                    .foregroundStyle(.teal)
            }
            Text(self.info)
                .font(.system(.body, design: .rounded))
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    CourseDetailView(course: CourseFactory().courses[0])
}
