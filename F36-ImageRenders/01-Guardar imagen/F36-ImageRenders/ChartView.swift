//
//  ChartView.swift
//  F36-ImageRenders
//
//  Created by Danilo Andrusco on 09-01-25.
//


import SwiftUI
//5. Importamos Charts
import Charts

struct ChartView: View {
    
    //6. copiaremos el let chartData del archivo F33-Carts llamado TemperatureCharts.swift y lo pegaremos aqui pero le eliminaremos el self a cada data ya que no pertenece a esta clase 
    let chartData = [(city: "Madrid", data: madData),
                     (city: "Barcelona", data: bcnData),
                     (city: "Palma de Mallorca", data: palData)]
    
    var body: some View {
        //7. Dentro de la VStack pondremos un titulo
        VStack{
            //8. Creamos el texto
            Text("Gráfico de Líneas")
                    .font(.system(.title, design: .rounded))
            //9. Y pegaremos el Chart completo que teniamos en el mismo fichero  llamado TemperatureCharts.swift
            Chart{
                ForEach(chartData, id: \.city) { series in
                    ForEach(series.data) { item in
                        LineMark(x: .value("Mes", item.date),
                                 y: .value("Temperatura", item.temperature)
                        )
                        .interpolationMethod(.monotone)
                        
                    }
                    .foregroundStyle(by: .value("Ciudad", series.city))
                    .symbol(by: .value("Ciudad", series.city))
                }
            }
            .frame(width: 380, height: 550)
            .chartXAxis {
                AxisMarks(values: .stride(by: .month)){ value in
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.month(.defaultDigits))
                }
            }
            .chartYAxis{
                AxisMarks(position: .leading)
            }
            .chartPlotStyle { content in
                content
                    .background(Color.teal.opacity(0.2))
            }
                //10. Creamos un texto explicativo
                Text("En la figura pueden verse las temperaturas de varias ciudades de España durante el año 2022-2023.")
                    .font(.system(.caption, design: .rounded))
            //11. Nos vamos a la ContentView

        }
    }
}

#Preview {
    ChartView()
}
