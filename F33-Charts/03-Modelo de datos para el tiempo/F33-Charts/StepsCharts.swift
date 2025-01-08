//
//  ContentView.swift
//  F33-Charts
//
//  Created by Danilo Andrusco on 06-01-25.
//

//1. Vamos a crear un nuevo grafico, para ello creamos un nuevo fichero de SwiftUI llamado TemperatureCharts
import SwiftUI
import Charts

//2. Para evitar confucion cambiaremos el nombre de la ContentView a StepsCharts
struct StepsCharts: View {
    //3. Ahora nos vamos a crear un nuevo fichero de SwiftFile llamado WeatherData
    let days = Calendar.current.shortWeekdaySymbols
    let steps = [10243, 7856, 8267, 9768, 3728, 5647, 9802]
    
    var body: some View {
        Chart{
            ForEach(self.days.indices, id: \.self ){ idx in
                BarMark(
                    x: .value("Pasos", self.steps[idx]),
                    y: .value("Día", self.days[idx])
                )
                .foregroundStyle(by: .value("Día", self.days[idx]))
                .annotation {
                    Text("\(self.steps[idx])")
                }
            }
        }
    }
}

#Preview {
    StepsCharts()
}
