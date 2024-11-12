//
//  ContentView.swift
//  F17-Tinder
//
//  Created by Danilo Andrusco on 20-08-24.
//

import SwiftUI

struct ContentView: View {
    
    //5. Hasata este momento, en este Arrays inicializamos todos los cursos, eso puede ser muy complejo cuando tengamos 1.000 cursos. La idea es solo añadir 2, el que se esta mostrando y el que esta por debajo
    var carViews: [CardView] = {
        var views = [CardView]()
        //6. Cambiaremos esta linea
        /*for course in courses{*/
        //7. Ahora llamaremos solo a la posicion 0 y 1
        for index in 0..<2 {
            //8. tanto a name como iamge deberemos pasarle index por los cursos
            views.append(CardView(name: courses[index].name, image: courses[index].image))
        }
        return views
    }()
    
    var body: some View {
        VStack {
            TopBar()
            ZStack{
                ForEach(self.carViews) { carViews in
                    carViews
                    //4.El zIndex nos aseguraremos que nos muestre la primera tarjeta (cursos)
                        .zIndex(self.isTopCard(cardView: carViews) ? 1: 0)
                }
            }
            Spacer(minLength: 16)
            BottomBar()
        }
        .padding()
    }
    //1. Crearemos una funcion para ordenar ls cursos para determinar su indece dentro del arrays
    private func isTopCard(cardView: CardView) -> Bool {
        //2. Si no la encuentra devolvera falso
        guard let index = self.carViews.firstIndex(where: {$0.id == cardView.id}) else {
            return false
        }
        //3. Si la encuentra devuelve devuelve su posicion igual a 0
        return index == 0
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
