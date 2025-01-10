//
//  SpeedometerGauge.swift
//  F37-Velocidad
//
//  Created by Danilo Andrusco on 10-01-25.
//


import SwiftUI

struct SpeedometerGauge : GaugeStyle {
    
    private var gradient = LinearGradient(gradient:
                                            Gradient(colors: [
                                                Color(red: 255/255, green: 0/255, blue: 0/255),
                                                Color(red: 255/255, green: 200/255, blue: 200/255)]
                                                    ),
                                          startPoint: .leading, endPoint: .trailing)
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            Circle()
                .foregroundStyle(Color.red.opacity(0.2))
            
            Circle()
                .trim(from: 0, to: 0.75*configuration.value)
                .stroke(self.gradient, lineWidth: 25)
                .rotationEffect(.degrees(135))
            
            Circle()
                .trim(from: 0, to: 0.75)
                .stroke(Color.white, style: StrokeStyle(lineWidth: 12, lineCap: .butt,
                                                        lineJoin: .round, dash: [1, 30],
                                                        dashPhase: 0))
                .rotationEffect(.degrees(135))
        
            VStack{
                configuration.currentValueLabel
                    .font(.system(size: 90, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                
                Text("KM/H")
                    .font(.system(size: 30, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
            }
            
        }
        .frame(width: 350, height: 350)
    }
}
