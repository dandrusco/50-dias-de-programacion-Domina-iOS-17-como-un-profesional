//
//  WeatherData.swift
//  F33-Charts
//
//  Created by Danilo Andrusco on 08-01-25.
//


import Foundation

//4. Creamos una estructura para los datos que sea identificable para tener un ID, tendremos una fecha y la temperatura
struct WeatherData: Identifiable {
    let id = UUID()
    let date : Date
    let temperature: Double
    //TODO: podemos guardar información de precipitaciones, humedad, tiempo (soleado, nublado etc...)
    
    //5. Creamos el inicializador
    init(year: Int, month: Int, day: Int, temperature: Double) {
        //6. Creamos para la fecha del propio Calendar y en el from lo inicilizaremos, como opcional le pasamos el dia de hoy
        self.date = Calendar.current.date(from: .init(year: year, month: month, day: day)) ?? Date()
        self.temperature = temperature
    }
    
}
//7. Ahora nos vamos a TemperatureCharts 
