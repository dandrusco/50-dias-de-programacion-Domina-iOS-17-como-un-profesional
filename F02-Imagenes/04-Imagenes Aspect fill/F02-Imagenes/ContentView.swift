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
        //2. cambiaremos el .bottom por .all para abarcar todo
            .ignoresSafeArea(.container, edges: .all)
        //1. Para mantener el aspecto original pero que quepa en la pantalla utilizamos
            .scaledToFill()
    }
}

#Preview {
    ContentView()
}
