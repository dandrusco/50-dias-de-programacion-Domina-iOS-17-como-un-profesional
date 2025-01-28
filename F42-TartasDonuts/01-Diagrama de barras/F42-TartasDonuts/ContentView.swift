//
//  ContentView.swift
//  F42-TartasDonuts
//
//  Created by Danilo Andrusco on 28-01-25.
//

import SwiftUI
//1. Para crear graficos necesitamos importart la libreria de Charts
import Charts

struct ContentView: View {
    
    //2. Creamos un arrays para las ventas, en forma de tuplas
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
            //3. Creamos un Chart y en su interior un ForEach para recorrer las ventas, donde el ID seran los nombres ya que ninguno se repite, nos quedaremos con los cursos
            Chart{
                ForEach(self.sales, id: \.name){ course in
                    //4. Implementaremos una BarMark, donde la X sera el nombre y la Y elvalor
                    BarMark(
                        x: .value("Nombre", course.name),
                        y: .value("ventas", course.count)
                    )
                    //5. Creamos un foregrand color para el nombre
                    .foregroundStyle(by: .value("Nombre", course.name))
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
