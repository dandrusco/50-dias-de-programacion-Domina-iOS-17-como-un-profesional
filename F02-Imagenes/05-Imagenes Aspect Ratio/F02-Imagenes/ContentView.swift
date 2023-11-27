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
            //1. otra forma es con aspectRatio y dentro del contentMode utilizar el .fit o .fill
            .aspectRatio(contentMode: .fill)
            //2. Si tulizamos el . fill y le agregamos un frame con un width de 800, podemos atraer mas la imagen, en cambio si utilizamos el .fit con un width de 300 por ejmplo, creare un cuadro (margenes)
            .frame(width: 800)
    }
}

#Preview {
    ContentView()
}
