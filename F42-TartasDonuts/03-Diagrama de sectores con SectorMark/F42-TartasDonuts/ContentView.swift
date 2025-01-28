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
                    //1. Eliminamos el BarMark
                    /*BarMark(
                         x: .value("ventas", course.count),
                         stacking: .normalized
                    )*/
                    
                    //2. Creamos un SectorMark
                    SectorMark(
                        //3. La X sera un angulo
                        angle: .value("Ventas", course.count)
                    )
                    .foregroundStyle(by: .value("Nombre", course.name))
                }
            }
            //4. El frame lo subiremos a 400
            .frame(height: 400)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
