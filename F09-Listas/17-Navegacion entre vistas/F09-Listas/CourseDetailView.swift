//
//  CourseDetailView.swift
//  F09-Listas
//
//  Created by Danilo Andrusco on 05-03-24.
//

import SwiftUI

struct CourseDetailView: View {
    
    //2. Tomara el curso de entrada
    var course: Course
    
    var body: some View {
        //4. La pegaremos aqui
        VStack(alignment: .leading, spacing: 8){
            Image(course.image)
                .resizable()
                //12. Cambiamos el fill por el fit
                .aspectRatio(contentMode: .fit)
                //13. Eliminamso el frame
                /*.frame(height: 150)*/
                .cornerRadius(25)
            
            Text(course.name)
                .font(.system(.title, design: .rounded))
                .bold()
                .lineLimit(1)
                .padding(.bottom, 2)
            
            
            Text("Creado por \(course.author)".uppercased())
                //7. El subheadline lo cambiaremos por en headline
                .font(.system(.headline, design: .rounded))
                .foregroundStyle(.secondary)
                //6. Eliminamos esta linea
                /*.lineLimit(2)*/
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
                //8. Eliminamos esta linea
                /*.lineLimit(3)*/
            
            //5. Le pondremos un Spacer para tirar todo el codigo para arriba
            Spacer()
        }
        //14. Meteremos un padding
        .padding()
    }
}

#Preview {
    //9. Ahora se nos queja ya que no puede arrancar sin un curso
    //11. Se lo pegaremos aqui, anteponiendo course:
    CourseDetailView(course: Course(name: "Álgebra Lineal", image: "algebralineal", author: "María Santos", difficulty: 1, description: "Curso para iniciarse en el mundo del álgebra lineal"))
}
