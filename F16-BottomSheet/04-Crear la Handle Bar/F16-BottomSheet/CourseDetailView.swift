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
            
            //2. Para ver como se veria arriba del todo meteremos un Spacer
            Spacer()
        }
    }
}

struct HandleBar: View {
    var body: some View {
        //1. Crearemos un rectangulo para recrear la barrita para subir o bajar
        Rectangle()
            .frame(width: 100, height: 8)
            .foregroundStyle(Color(.systemGray4))
            .cornerRadius(16)
    }
}

struct TitleBar: View {
    var body: some View {
        EmptyView()
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
