//
//  CourseDetailView.swift
//  F16-BottomSheet
//
//  Created by Danilo Andrusco on 28-05-24.
//

import SwiftUI

struct CourseDetailView: View {
    
    //1. Esta claro que vamos a necesitar un curso para pintar nuestras estructuras
    let course: Course
    
    var body: some View {
        VStack{
            HandleBar()
            TitleBar()
            HeaderView()
            DetailView()
        }
    }
}

struct HandleBar: View {
    var body: some View {
        EmptyView()
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
    //2. Para que no nos de error deberemos meter los cursos dentro de Course, para ello nos vamos a ir a la COntentView
    //8. AHora llamamos a CourseFactory() pasandole el curso en la posicion 0
    CourseDetailView(course: CourseFactory().courses[0])
}
