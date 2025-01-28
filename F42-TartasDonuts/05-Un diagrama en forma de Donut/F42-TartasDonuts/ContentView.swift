//
//  ContentView.swift
//  F42-TartasDonuts
//
//  Created by Danilo Andrusco on 28-01-25.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    private var sales = [
        (name: "iOS 17",        count: 321),
        (name: "Estadística",   count: 456),
        (name: "Kotlin",        count: 126),
        (name: "Unity",         count: 548),
        (name: "Power BI",      count: 428),
        (name: "Excel",         count: 321),
        (name: "Swift 5",       count: 78)
    ]

    var body: some View {
        VStack {
            Chart{
                ForEach(self.sales, id: \.name){ course in
                    SectorMark(
                        angle: .value("Ventas", course.count),
                        //1. Para cambiar de un grafico de torta a uno de dunut debmos especificar un innerRadius (radio interno), le daremos un 60%
                        innerRadius: .ratio(0.6),
                        outerRadius: course.name == "Unity" ? 160 : 140,
                        angularInset: 2.0
                    )
                    .foregroundStyle(by: .value("Nombre", course.name))
                    //2. Tambien podemos rendondear cada grafico
                    .cornerRadius(5.0)
                    .annotation(position: .overlay) {
                        Text("\(course.count)")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
            }
            .frame(height: 400)
            //3. Con chartBackground podemos poner una imagen
            .chartBackground { proxy in
                //4. Pondremos una imagen
                /*Image(systemName: "book")*/
                //6. Comentaremos la linea de arriba por que con un text podemos meter emojis
                Text("📚")
                    //5. Configuramos el tamaño de la imagen
                    .font(.system(size: 80))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
