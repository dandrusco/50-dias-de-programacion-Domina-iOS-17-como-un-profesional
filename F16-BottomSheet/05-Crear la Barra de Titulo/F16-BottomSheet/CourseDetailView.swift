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
            HeaderView()
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
        //1. Crearemos un titulo comun para todos los cursos
        HStack{
            Text("Detalles del curso")
                .font(.title2)
                .foregroundStyle(.primary)
            //2. Meteremos un Spacer para tirar el texto a la izquierda
            Spacer()
        }
        //3. Le añadiremos un pading horizontal de unos 24 puntos para que no quede pegado al bordel del iphone
        .padding(.horizontal, 24)
    }
}

struct HeaderView: View {
    var body: some View {
        EmptyView()
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
