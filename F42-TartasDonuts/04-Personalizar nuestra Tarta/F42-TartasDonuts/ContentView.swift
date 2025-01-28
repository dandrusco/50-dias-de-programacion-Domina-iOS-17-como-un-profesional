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
                        //2. Podemos destacar uno de ellos con outerRadius
                        outerRadius: course.name == "Unity" ? 160 : 140,
                        //1. Para separar la torta utilizamos angularInset
                        angularInset: 2.0
                    )
                    .foregroundStyle(by: .value("Nombre", course.name))
                    //3. Otra forma es crear una capa por encima con annotation, con el parametro overlay (por encima)
                    .annotation(position: .overlay) {
                        //4. Convertiremos en texto el valor de las ventas
                        Text("\(course.count)")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
            }
            .frame(height: 400)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
