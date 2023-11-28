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
            .clipped()
            .overlay(
                //1. otra forma mas rapida de hacer lo mismo es asi
                /*Rectangle()
                    .foregroundStyle(.black)*/
                Color.black
                    .opacity(0.4)
                //2. Eso quiere decir que Color tambien es una vista
                //3. Podemos agregar otro overlay dentro de un overlay
                    .overlay(
                        Text("Bruno Ignacio")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .frame(width: 200)
                    )
            )
    }
}

#Preview {
    ContentView()
}
