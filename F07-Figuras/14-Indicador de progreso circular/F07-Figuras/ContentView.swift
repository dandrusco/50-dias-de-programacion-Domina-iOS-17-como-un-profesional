//
//  ContentView.swift
//  F07-Figuras
//
//  Created by Danilo Andrusco on 20-12-23.
//

import SwiftUI

struct ContentView: View {
    
    //5. Crearemos una gradiente para el color
    private var colorGradient = LinearGradient(gradient: Gradient(colors: [Color(red: 180/255, green: 150/255, blue:210/255), Color(red: 100/255, green: 110/255, blue:180/255)]), startPoint: .trailing, endPoint: .leading)
    
    var body: some View {
        //1. Crearemos unos indicadores de progreso circular (como los de auto o app de deportes)
        ZStack{
            //2. Crearemos un circulo
            Circle()
                //3. Pintamos solo la linea del circulo con stroke
                .stroke(Color(.systemGray5), lineWidth: 15)
                //4. Tendra una altura y anchura de 250
                .frame(width: 250, height: 250)
            
            //6. Pintaremos otro circulo
            Circle()
                //8. con .trim lo pintaremso al 85%
                .trim(from: 0, to: 0.85)
                //7. Al Stroke le pasaemos la gradiente de color (colorGradient)
                .stroke(colorGradient, lineWidth: 15)
                .frame(width: 250, height: 250)
                //9. Rotaremos el circulo para que parta de arriba
                .rotationEffect(Angle(degrees: 270))
            
                //10. Le pondremos 2 textos a traves de un Overlay embebiendolo en una VStack
                .overlay(
                    VStack {
                        Text("85%")
                            .font(.system(size: 60, weight: .black, design: .rounded))
                            .foregroundStyle(Color(.systemIndigo))
                        Text("Completado")
                            .font(.system(.title3, design: .rounded))
                            .foregroundStyle(Color(.systemIndigo))
                    }
                )
        }
    }
}


#Preview {
    ContentView()
}

