//
//  TemperatureCharts.swift
//  F33-Charts
//
//  Created by Danilo Andrusco on 08-01-25.
//


import SwiftUI
//8. Debemos importar Chart
import Charts

struct TemperatureCharts: View {
    //9. Creamos la BBDD de la temperatura de Madrid
    let madData = [
        WeatherData(year: 2022, month: 9, day: 1, temperature: 32),
        WeatherData(year: 2022, month: 10, day: 1, temperature: 27),
        WeatherData(year: 2022, month: 11, day: 1, temperature: 15),
        WeatherData(year: 2022, month: 12, day: 1, temperature: 7),
        WeatherData(year: 2023, month: 1, day: 1, temperature: 1),
        WeatherData(year: 2023, month: 2, day: 1, temperature: 3),
        WeatherData(year: 2023, month: 3, day: 1, temperature: 8),
        WeatherData(year: 2023, month: 4, day: 1, temperature: 12),
        WeatherData(year: 2023, month: 5, day: 1, temperature: 19),
        WeatherData(year: 2023, month: 6, day: 1, temperature: 21),
        WeatherData(year: 2023, month: 7, day: 1, temperature: 30),
        WeatherData(year: 2023, month: 8, day: 1, temperature: 35)
    ]
    //10. Creamos la BBDD de la temperatura de Barcelona
    let bcnData = [
        WeatherData(year: 2022, month: 9, day: 1, temperature: 23),
        WeatherData(year: 2022, month: 10, day: 1, temperature: 20),
        WeatherData(year: 2022, month: 11, day: 1, temperature: 15),
        WeatherData(year: 2022, month: 12, day: 1, temperature: 12),
        WeatherData(year: 2023, month: 1, day: 1, temperature: 12),
        WeatherData(year: 2023, month: 2, day: 1, temperature: 11),
        WeatherData(year: 2023, month: 3, day: 1, temperature: 14),
        WeatherData(year: 2023, month: 4, day: 1, temperature: 17),
        WeatherData(year: 2023, month: 5, day: 1, temperature: 20),
        WeatherData(year: 2023, month: 6, day: 1, temperature: 24),
        WeatherData(year: 2023, month: 7, day: 1, temperature: 26),
        WeatherData(year: 2023, month: 8, day: 1, temperature: 26)
    ]
    //11. Creamos la BBDD de la temperatura de Palma
    let palData = [
        WeatherData(year: 2022, month: 9, day: 1, temperature: 23),
        WeatherData(year: 2022, month: 10, day: 1, temperature: 22),
        WeatherData(year: 2022, month: 11, day: 1, temperature: 15),
        WeatherData(year: 2022, month: 12, day: 1, temperature: 12),
        WeatherData(year: 2023, month: 1, day: 1, temperature: 11),
        WeatherData(year: 2023, month: 2, day: 1, temperature: 12),
        WeatherData(year: 2023, month: 3, day: 1, temperature: 13),
        WeatherData(year: 2023, month: 4, day: 1, temperature: 15),
        WeatherData(year: 2023, month: 5, day: 1, temperature: 17),
        WeatherData(year: 2023, month: 6, day: 1, temperature: 22),
        WeatherData(year: 2023, month: 7, day: 1, temperature: 26),
        WeatherData(year: 2023, month: 8, day: 1, temperature: 27)
    ]

    var body: some View {
        //12. Creamos un arrays para todos los datos
        let chartData = [(city: "Madrid", data: self.madData),
                         (city: "Barcelona", data: self.bcnData),
                         (city: "Palma de Mallorca", data: self.palData)]
        
        //13. Creamos el Diagrama de Líneas
        Chart{
            //14. Recorremos el chartData para las ciudades
            ForEach(chartData, id: \.city) { series in
                //15.Metemos otro bucle tomando los datos "series" del anterior blucle quedandonos con el data
                ForEach(series.data) { item in
                    //16 Creamos un LineMark para representar los meses con las diferentes temperaturas
                    LineMark(x: .value("Mes", item.date),
                             y: .value("Temperatura", item.temperature)
                    )
                    //17. Pintamos la forma en que queramos que se pinten las lineas
                    .interpolationMethod(.monotone)
                     
                }//18. Para poder gegmentarlo por ciudad lo hacemos en el foregroundStyle pasandole la ciudad
                .foregroundStyle(by: .value("Ciudad", series.city))
                //18. Como podemos ver todos tienen un circulo, para que tengan uno distinto lo podemos hacer así
                .symbol(by: .value("Ciudad", series.city))
            }
        }
        //19 Limitaremos la anchura y la altura
        .frame(width: 380, height: 550)
        //20.Con chartXAxis podemos personalizar lo que queramos en el eje horizontal
        .chartXAxis {
            //21. Con AxisMarks personalizaremos las marcas, el valor sera mensual (numericos)
            AxisMarks(values: .stride(by: .month)){ value in
                //22. Pintamos las lineas del eje
                AxisGridLine()
                //23. AxisValueLabel formateamos la fecha para que solo aparezcan los digitos
                AxisValueLabel(format: .dateTime.month(.defaultDigits))
            }
        }
        //24. Cambiaremos el eje vertical
        .chartYAxis{
            //25. Ponemos los datos al lado izquierdo
            AxisMarks(position: .leading)
        }
        //25. Podemos ambiar el color del fondo del grafico
        .chartPlotStyle { content in
            content
            //26. En el content podemos pintarlo incluso con opacidad
                .background(Color.teal.opacity(0.2))
        }
    }
}

#Preview {
    TemperatureCharts()
}
