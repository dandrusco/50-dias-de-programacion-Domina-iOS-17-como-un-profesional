//
//  ContentView.swift
//  F03-Apilar
//
//  Created by Danilo Andrusco on 28-11-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1. Solo nos quedaremos con el VStack para partir un proyecto nuevo, y tambien eliminaremos el padding
        //3. Podemos alinear ambos textos, este parametro se lo debemos pasar a la VStack como alignment, en este caso a la izquiera con leading, si queremos separar el primer texto del segundo, le podemos agregar un tercer parametro llamado spacing
        VStack (alignment: .leading, spacing: 5) {
           //2. Pondremos dos textos
            Text("Elige")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
            Text("Tu suscripción")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
        }
    }
}

#Preview {
    ContentView()
}
