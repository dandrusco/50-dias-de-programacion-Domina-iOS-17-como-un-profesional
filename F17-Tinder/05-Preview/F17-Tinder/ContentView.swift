//
//  ContentView.swift
//  F17-Tinder
//
//  Created by Danilo Andrusco on 20-08-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TopBar()
            let course = courses[0]
            CardView(name: course.name, image: course.image)
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

//1. Que pasa si queremos programar solo la topbar generando un preview de esta? La podemos hacer a continuacion
#Preview ("TopBar"){
    TopBar()
}
//2. Si se fijan ahora en nuestra preview en tiempo real aparece arriba del todo dos pestañas, una para la ContentView inicial y ahora para la TopBar, si apretamos en la TopBar vemos que solo nos muestra ella

//3. Realizaremos lo mismo para la BottomBar
#Preview ("BottomBar"){
    BottomBar()
}
