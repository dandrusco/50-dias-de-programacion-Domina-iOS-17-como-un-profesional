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
            //1. Cambiaremos el texto por una imagen
            /*Text("Velocidad")*/
            //2. Pondremos la imagen
            Image(systemName: "gauge.with.dots.needle.33percent")
                .font(.system(size:40.0))
        } currentValueLabel: {
            //3. meteremos una imagen, al lado del texto de los 120 km/h, creamos una HStack
            HStack {
                Image(systemName: "gauge.medium")
                Text("\(self.progress.formatted(.number)) km/h")
            }
        } minimumValueLabel: {
            Text(0.formatted(.number))
        } maximumValueLabel: {
            Text(self.maxSpeed.formatted(.number))
        }
        .padding()
    }
}

#Preview {
    SpeedometerView()
}
