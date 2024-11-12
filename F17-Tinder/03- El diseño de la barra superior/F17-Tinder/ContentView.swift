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
            //2. LLamamos a la TopBar
            TopBar()
            let course = courses[0]
            CardView(name: course.name, image: course.image)
        }
        .padding()
    }
}

//1. Declararemos 2 estructuras, una para la barra superior (TopBar) y otra para la barra inferior (BottomBar) ambas con un HStack
struct TopBar: View {
    var body: some View {
        HStack {
            //2. Configuramos la TopBar
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
            
        }
    }
}

#Preview {
    ContentView()
}
