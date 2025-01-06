//
//  ContentView.swift
//  F33-Charts
//
//  Created by Danilo Andrusco on 06-01-25.
//

import SwiftUI
//1. Para trabajar con graficos debemnos importarlo
import Charts

struct ContentView: View {
    var body: some View {
        //2. Creamos un objeto tipo Chart
        Chart{
            //3. Creamos un diagrama de barras
            BarMark(
                //4. Suministramos la coordenada X e Y
                x: .value("Dia", "Lunes"),
                y: .value("Pasos", 6289)
            )
            //5. Creamos orta
            BarMark(
                x: .value("Dia", "Martes"),
                y: .value("Pasos", 4890)
            )
            //6. Para el miercoles
            BarMark(
                x: .value("Dia", "Miercoles"),
                y: .value("Pasos", 7290)
            )
        }
    }
}

#Preview {
    ContentView()
}
