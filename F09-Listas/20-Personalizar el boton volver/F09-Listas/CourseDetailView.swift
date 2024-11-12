//
//  CourseDetailView.swift
//  F09-Listas
//
//  Created by Danilo Andrusco on 05-03-24.
//

import SwiftUI

struct CourseDetailView: View {
    
    //8. Crearemos una variable de entorno arriba del todo (Luego profundizaremos) que ejecutara un dismiss para cerrar la vista actual y la asociaremos a la variable dismiss
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
        //2. Aqui le decimos que esta vista debe impresindir de la barra de navegacion
        .navigationBarBackButtonHidden(true)
        
        //4. SwiftUI nos proporciona un modificador para llamado toolbar para crear nuestras propios items para la barra de navegacion
        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button(){
                    //6. Para volver a tras necesitamos una variable de entorno que nos permita crear un dismiss, un cierre de la ventana actual
                    dismiss()
                    //7. Ahora nuestro programa no sabe que es un dismiss, por lo tanto crearemos una variable de entorno arriba del todo
                } label: {
                    //5. Pondremos la imagen y el nombre del curso en cuestion
                    Text("\(Image(systemName: "arrow.uturn.backward"))\(course.name)")
                        .foregroundStyle(.teal)
                }
            }
        }
    }
}

#Preview {
    CourseDetailView(course: Course(name: "Álgebra Lineal", image: "algebralineal", author: "María Santos", difficulty: 1, description: "Curso para iniciarse en el mundo del álgebra lineal"))
}
