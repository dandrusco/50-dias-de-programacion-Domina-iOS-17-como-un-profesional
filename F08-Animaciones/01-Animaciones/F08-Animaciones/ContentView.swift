//
//  ContentView.swift
//  F08-Animaciones
//
//  Created by Danilo Andrusco on 05-01-24.
//

import SwiftUI

struct ContentView: View {
    //3. Vamos a definir tres estados para que cuando lo precionemos el corazon y el circulo cambien de color y se haga mas grande
    @State private var circleChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    
    var body: some View {
        //1. Crearemos un circulo de 250 x 250 dentro de un ZStack
        ZStack{
            Circle()
                .frame(width: 250, height: 250)
                .foregroundStyle(.teal)
            
            //2. Pondremos una imagen
            Image(systemName: "heart.fill")
                .font(.system(size: 80))
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    ContentView()
}
