//
//  CourseDetailView.swift
//  F09-Listas
//
//  Created by Danilo Andrusco on 05-03-24.
//

import SwiftUI

struct CourseDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var course: Course
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(25)
            
            Text(course.name)
                .font(.system(.title, design: .rounded))
                .bold()
                .lineLimit(1)
                .padding(.bottom, 2)
            
            
            Text("Creado por \(course.author)".uppercased())
                .font(.system(.headline, design: .rounded))
                .foregroundStyle(.secondary)
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
            
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button(){
                    dismiss()
                } label: {
                    Text("\(Image(systemName: "arrow.uturn.backward"))\(course.name)")
                        .foregroundStyle(.teal)
                }
            }
        }
    }
}

#Preview {
    //6. Agregaremos tambien el precio
    CourseDetailView(course: Course(name: "Álgebra Lineal", image: "algebralineal", author: "María Santos", difficulty: 1, description: "Curso para iniciarse en el mundo del álgebra lineal", price: 19.99))
}
