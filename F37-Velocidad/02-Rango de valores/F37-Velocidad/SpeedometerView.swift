//
//  ContentView.swift
//  F37-Velocidad
//
//  Created by Danilo Andrusco on 10-01-25.
//

import SwiftUI

//6. Aprovecharemos de cambiarle el nombre a la ContentView
struct SpeedometerView: View {
   
    //3. Ahora el 0.5 ya ni se aprecia en el grafico por lo que lo cambiaremos a 120.0
    @State private var progress = 120.0
    
    //1. Si quisieramos programar un marcador de velocidad, necesitariamos un minimo y maximo, para ello crearemos una variable para el valor maximo
    private var maxSpeed = 300.0
    
    var body: some View {
        //2. Los valores minimo y maximo se lo pasaremos en el value del Gauge
        Gauge(value: self.progress, in: 0...self.maxSpeed) {
            //4. El texto progreso pasara a haccer velocidad
            Text("Velocidad")
        } currentValueLabel: {
            //5. Modificaremos el texto para que nos diga KM y que sea numerico en vez de porcentaje
            Text("\(self.progress.formatted(.number)) km/h")
        } minimumValueLabel: {
            //6. en minimumValueLabel maximumValueLabel tambien modificaremos para que nos muestre el numero en vez del %
            Text(0.formatted(.number))
        } maximumValueLabel: {
            //7. En vez del 100 le pasaremos la variable maxSpeed
            Text(self.maxSpeed.formatted(.number))
        }
        .padding()
    }
}

#Preview {
    SpeedometerView()
}
