//
//  ContentView.swift
//  F07-Figuras
//
//  Created by Danilo Andrusco on 20-12-23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        //1. Podemos representar Arcos en el Path
        Path() { path in
            //2. Nos pondremos al centro de la pantalla
            path.move(to: CGPoint(x: 200, y: 200))
            //3. Ahora pintamos el Arco con addArc, deberemos pasarle los siguientes parametros. El Centro a travez de un init, el radio, angulo de inicio y angulo final y por ultimo el clockwise que es si es false se pinta en el sentido horario
            path.addArc(center: .init(x: 200, y: 200), radius: 100, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true) //Al poner true y angulo de 90 lo que ocurre es que de 0 a 90 no se pinta
        }
        //4. Rellenamos
        .fill(.cyan)
    }
}

#Preview {
    ContentView()
}

