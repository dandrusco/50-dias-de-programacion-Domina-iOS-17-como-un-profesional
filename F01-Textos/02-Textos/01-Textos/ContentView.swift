//
//  ContentView.swift
//  01-Textos
//
//  Created by Danilo Andrusco on 23-11-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1. Cambiaremos por un texto mas grande
        Text("En  un lugar de la Mancha, de cuyo nombre no quiero acordarme. Palablas con las que empieza el libro de Don Quijote de la Mancha")
            .fontWeight(.bold)
            //2. Bararemos de 40 a 25 el tamaño
            .font(.system(size: 25, design: .rounded))
            .foregroundStyle(.purple)
            //3. El texto esta alineado a la izquierda por dejecto, lo podemos cambiar por ejemplo centrado con
            .multilineTextAlignment(.center)
            //4. Podemos limitar el numero de filas
            .lineLimit(3)
            //5. por dejecto corta al final pero podemos cortarlo por ejemplo al principio de la ultima liena con .head
            .truncationMode(.head)
            //6. Podemos ajustar para separar mas las lineas
            .lineSpacing(12)
            //7. Para separar en horizontal utilizamos padding
            .padding(40)
    }
}

#Preview {
    ContentView()
}
