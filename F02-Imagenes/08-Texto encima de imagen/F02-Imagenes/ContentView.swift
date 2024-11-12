//
//  ContentView.swift
//  F02-Imagenes
//
//  Created by Danilo Andrusco on 27-11-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("Bruno")
            .resizable()
            .ignoresSafeArea(.container, edges: .all)
            .aspectRatio(contentMode: .fill)
            .frame(width: 400, height: 400)
            .clipShape(Circle())
            .opacity(0.5)
            .overlay(
                //1. Eliminamos el dedo para arriba y agregaremos un texto
                Text("Bruno Ignacio")
                    .fontWeight(.black)
                    .font(.system(.largeTitle, design: .rounded))
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.blue)
                    .opacity(0.7)
                    //2. Con cornerRadios pndremos el azul redondeado
                    .cornerRadius(25),
                //3. Alinaremos abajo 
                alignment: .bottom
            )
    }
}

#Preview {
    ContentView()
}
