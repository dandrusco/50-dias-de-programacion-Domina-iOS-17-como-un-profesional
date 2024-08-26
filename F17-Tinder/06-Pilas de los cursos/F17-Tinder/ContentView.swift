//
//  ContentView.swift
//  F17-Tinder
//
//  Created by Danilo Andrusco on 20-08-24.
//

import SwiftUI

struct ContentView: View {
    
    //1. Crearemos una variable para las lista de cursos
    var carViews: [CardView] = {
        //2. Crearemnos el constructor de este arrays de listas
        var views = [CardView]()
        //3. Lo rellenaremos por cada curso
        for course in courses{
            //4. A las vistas le agregaremos cada courso
            views.append(CardView(name: course.name, image: course.image))
        }
        //5. Al acabar el bucle lo devolvemos con un return
        return views
        //6. Abriremos y cerraremos unos parentesis ya que utilizamos un autocontructor
    }()
    var body: some View {
        VStack {
            TopBar()
            //7. Eliminaremos nuestra tarjeta
            /*let course = courses[0]
            CardView(name: course.name, image: course.image)*/
            
            //8. Agregamos el arrays en una ZStack
            ZStack{
                ForEach(self.carViews) { carViews in
                    carViews
                }
            }
            //9. Vemos que tenemos algunos problemas, aparecen todos los cursos, uno encima de otro, los textos en color teal algunos son mas grandes que otro. Nos vamos a la CardView
            Spacer(minLength: 16)
            BottomBar()
        }
        .padding()
    }
}

struct TopBar: View {
    var body: some View {
        HStack {
            Image(systemName: "line.3.horizontal")
                .font(.system(size: 35))
                .foregroundStyle(.secondary)
            Spacer()
            Image(systemName: "brain.filled.head.profile")
                .font(.system(size: 40))
                .foregroundStyle(.teal)
            Spacer()
            Image(systemName: "heart.circle")
                .font(.system(size: 35))
                .foregroundStyle(.secondary)
        }
        .padding(24)
    }
}

struct BottomBar: View {
    var body: some View {
        HStack {
            Image(systemName: "xmark")
                .font(.system(size: 35))
                .foregroundStyle(.red)
            Spacer()
            
            Button {
                //TODO: abrir el curso en la web
            } label: {
                Text("Ver el curso")
                    .font(.system(.headline, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    .background(.teal)
                    .cornerRadius(15)
            }
            Spacer()
            
            Image(systemName: "heart")
                .font(.system(size: 35))
                .foregroundStyle(.green)
        }.padding(24)
    }
}

#Preview {
    ContentView()
}

#Preview ("TopBar"){
    TopBar()
}

#Preview ("BottomBar"){
    BottomBar()
}
