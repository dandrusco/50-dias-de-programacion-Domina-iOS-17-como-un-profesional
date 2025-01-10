//
//  ContentView.swift
//  F37-Velocidad
//
//  Created by Danilo Andrusco on 10-01-25.
//

import SwiftUI

struct SpeedometerView: View {

    @State private var progress = 120.0
    
    private var maxSpeed = 300.0
    
    var body: some View {
        Gauge(value: self.progress, in: 0...self.maxSpeed) {
            Image(systemName: "gauge.with.dots.needle.33percent")
                .font(.system(size:40.0))
            //2. Si queremos cambiar el color de los iconos, se deben hacer uno a uno
                .foregroundStyle(.red)
        } currentValueLabel: {
            HStack {
                //4. Eliminaremos la imagen para apreciarlo mejor
                /*Image(systemName: "gauge.medium")*/
                Text("\(self.progress.formatted(.number)) km/h")
            }
        } minimumValueLabel: {
            Text(0.formatted(.number))
        } maximumValueLabel: {
            Text(self.maxSpeed.formatted(.number))
        }
        //3. Tambien tenemos estilos, por defecto esta el .linearCapacity, tambien el .accessoryLinear, accessoryLinearCapacity, accessoryCircular, accessoryCircularCapacity
        .gaugeStyle(.accessoryCircularCapacity)
        //1. Para pintarlo ocupamos Tint
        .tint(.teal)
        .padding()
    }
}

#Preview {
    SpeedometerView()
}
