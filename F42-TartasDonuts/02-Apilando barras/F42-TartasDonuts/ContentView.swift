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
                    BarMark(
                        //1. Para crear un diagrama apilado, basta con eliminar la X o la Y. Nos quedaremos con las ventas
                        //3. adicianalmente le podemos indicar otros parametros como el stacking, como es el center o el normalizado
                        x: .value("ventas", course.count),
                        stacking: .normalized
                        /*y: .value("ventas", course.count)*/
                    )
                    .foregroundStyle(by: .value("Nombre", course.name))
                }
            }
            //2. Configuraremos el frame a 100
            .frame(height: 100)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
