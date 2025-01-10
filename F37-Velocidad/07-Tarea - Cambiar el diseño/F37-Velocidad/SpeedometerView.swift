//
//  ContentView.swift
//  F37-Velocidad
//
//  Created by Danilo Andrusco on 10-01-25.
//


import SwiftUI

struct SpeedometerView: View {

    @State private var progress = 280.0
    
    private var maxSpeed = 300.0
    
    var body: some View {
        Gauge(value: self.progress, in: 0...self.maxSpeed) {
            Image(systemName: "gauge.with.dots.needle.33percent")
                .font(.system(size:40.0))
                .foregroundStyle(.red)
        } currentValueLabel: {
            HStack {
                Text(self.progress.formatted(.number))
            }
        } minimumValueLabel: {
            Text(0.formatted(.number))
        } maximumValueLabel: {
            Text(self.maxSpeed.formatted(.number))
        }
        .gaugeStyle(SpeedometerGauge())
        .tint(.teal)
        .padding()
    }
}

#Preview {
    SpeedometerView()
}
