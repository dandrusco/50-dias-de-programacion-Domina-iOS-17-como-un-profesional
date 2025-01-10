//
//  SpeedometerGauge.swift
//  F37-Velocidad
//
//  Created by Danilo Andrusco on 10-01-25.
//


import SwiftUI

//1. La estructura se debe adaptar al protocolo GaugeStyle
struct SpeedometerGauge : GaugeStyle {
    
    //2. Crearemos un gradiente de colores para un inicio a fin
    private var gradient = LinearGradient(gradient:
                                            Gradient(colors: [
                                                Color(red: 182/255, green: 150/255, blue: 206/255),
                                                Color(red: 89/255, green: 140/255, blue: 160/255)]
                                                    ),
                                          startPoint: .leading, endPoint: .trailing)
    
    //3. La funcion que debemos sobreescribir se llama makeBody
    func makeBody(configuration: Configuration) -> some View {
        //4. Creamos una Zstack
        ZStack{
            //5. Creamos un circulo de color teal con una opacidad
            Circle()
                .foregroundStyle(Color.teal.opacity(0.2))
                //6. Nos vamos a la SpeedometerView para ver los cambios en tiempo real
            
            //9. Encima de este pintaremos otro circulo
            Circle()
                //10. Ocupara el 75% de la pantalla
                .trim(from: 0, to: 0.75*configuration.value)
                //11. Pintamos la linea exterior con la gradiente roja y con 25 puntos de anchura
                .stroke(self.gradient, lineWidth: 25)
                //12. Para que se vea correctamente le cambiaremos la rotacion
                .rotationEffect(.degrees(135))
            
            //13. Puntamos otro circulo
            Circle()
                .trim(from: 0, to: 0.75)
                //14. En el Stroker crearemos las lineas divisorias y las debemos rotar
                .stroke(Color.black, style: StrokeStyle(lineWidth: 12, lineCap: .butt,
                                                        lineJoin: .round, dash: [1, 30],
                                                        dashPhase: 0))
                .rotationEffect(.degrees(135))
            //16. Para mostras los valores meteremos una VStack el configuration.currentValueLabel, le metemos un font y el color teal
            VStack{
                configuration.currentValueLabel
                    .font(.system(size: 90, weight: .bold, design: .rounded))
                    .foregroundStyle(.teal)
                //17. Podemos configurar aqui el KM/h
                Text("KM/H")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .foregroundStyle(.teal)
            }
            
        }
        //18. Por ultimo configuramos el frame
        .frame(width: 350, height: 350)
        //19. Ahora nos vamos a SpeedometerView
    }
    
}
