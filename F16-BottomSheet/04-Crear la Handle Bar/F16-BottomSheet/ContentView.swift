//
//  ContentView.swift
//  F09-Listas
//
//  Created by Danilo Andrusco on 13-02-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            List{
                ForEach(CourseFactory().courses) { course in
                    SimpleImageRow(course: course)
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
