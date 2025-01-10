//
//  ContentView.swift
//  F37-Velocidad
//
//  Created by Danilo Andrusco on 10-01-25.
//

import SwiftUI

struct ContentView: View {
    
    //1. Vamos a implementar una barra de progreso (Gauge)
    //2. Para ello crearemos una variable de estado
    @State private var progress = 0.5
    
    var body: some View {
        //3. Para crearla debemos llamar a Gauge y pasarle por parametro el progreso creado con la variable de esta mas un label
        Gauge(value: self.progress) {
            Text("Progreso")
            //4. podemos ponerle mas parametro, como por ejemplo currentValueLabel para poner un % abajo
        } currentValueLabel: {
            Text(self.progress.formatted(.percent))
            //5. Tambien podemos poner el minimo y maximo de la barra de progreso
        } minimumValueLabel: {
            Text(0.formatted(.percent))
        } maximumValueLabel: {
            Text(100.formatted(.percent)    )
        }
        //6. Metemos un padding para el respiro de datos
        .padding()
    }
}

#Preview {
    ContentView()
}
