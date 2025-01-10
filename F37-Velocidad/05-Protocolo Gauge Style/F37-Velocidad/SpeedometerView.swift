//
//  ContentView.swift
//  F37-Velocidad
//
//  Created by Danilo Andrusco on 10-01-25.
//


//1. Implementaremos nuestro propio estilo de Gauge, para ello creamos un nuevo fichero de SwiftUI llamado SpeedometerGauge 
import SwiftUI

struct SpeedometerView: View {

    @State private var progress = 120.0
    
    private var maxSpeed = 300.0
    
    var body: some View {
        Gauge(value: self.progress, in: 0...self.maxSpeed) {
            Image(systemName: "gauge.with.dots.needle.33percent")
                .font(.system(size:40.0))
                .foregroundStyle(.red)
        } currentValueLabel: {
            HStack {
                //20. Como vemos ahora nos aparecen dos veces el KM/H por lo tanto eliminaremos este
                Text(self.progress.formatted(.number))
            }
        } minimumValueLabel: {
            Text(0.formatted(.number))
        } maximumValueLabel: {
            Text(self.maxSpeed.formatted(.number))
        }
        //7. Ahora en la gaugeStyle llamamos a nuestra estructura SpeedometerGauge
        .gaugeStyle(SpeedometerGauge())
        //8. Continuamos en la SpeedometerGauge
        .tint(.teal)
        .padding()
    }
}

#Preview {
    SpeedometerView()
}
