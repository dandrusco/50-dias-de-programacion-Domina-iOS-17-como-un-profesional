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
            //2. Le pasasmos el curso que recibimos por parametro
            HeaderView(courses: self.course)
            DetailView()
            
            Spacer()
        }
    }
}

struct HandleBar: View {
    var body: some View {
        Rectangle()
            .frame(width: 100, height: 8)
            .foregroundStyle(Color(.systemGray4))
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
    
    //1. La HeaderView tendra los cursos
    let courses : Course
    var body: some View {
        //3. Pondremos la imagen
        Image(courses.image)
            .resizable()
            .scaledToFit()
            //5. Nos quedaremos con el anchode la pantalla
            .frame(width: UIScreen.main.bounds.width)
        //6. Meteremos un Overley para agregar el titulo y la ruta
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
        //4. Eliminamos esta linea
        /*EmptyView()*/
    }
}

struct DetailView: View {
    var body: some View {
        EmptyView()
    }
}

#Preview {
    CourseDetailView(course: CourseFactory().courses[0])
}
