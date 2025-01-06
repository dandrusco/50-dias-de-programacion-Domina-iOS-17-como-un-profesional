//
//  ContentView.swift
//  F33-Charts
//
//  Created by Danilo Andrusco on 06-01-25.
//

import SwiftUI
import Charts

struct ContentView: View {
    //1. Para no estar creando un BarMark por cada dia de la semana podemos hacer lo siguiente, crearemos un arrays con los dias y otro con los pasos
    //2. Los dias los podemos construir apartir de la clase Calendar.current y probaremos con el shortWeekdaySymbols
    let days = Calendar.current.shortWeekdaySymbols
    //3. Los pasos los inventaremos
    let steps = [10243, 7856, 8267, 9768, 3728, 5647, 9802]
    
    var body: some View {
        Chart{
            //5. Creamos un bucle para recorrer los indices de days
            ForEach(self.days.indices, id: \.self ){ idx in
                BarMark(
                    //6. Pintamos los graficos horizontal, para ello debe ir primero los pasos y luego los dias 
                    x: .value("Pasos", self.steps[idx]),
                    y: .value("Día", self.days[idx])
                )
                //7. Podemos pintar los graficos con el .foregroundStyle y asosiar el color a una de las variables, por ejemplo por dia
                .foregroundStyle(by: .value("Día", self.days[idx]))
                //8. Podemos crear anotaciones
                .annotation {
                    //9. Le meteremos un texto con los pasos
                    Text("\(self.steps[idx])")
                }
            }
            //4. Eliminamos estos dos
            /*BarMark(
                x: .value("Dia", "Martes"),
                y: .value("Pasos", 4890)
            )
            BarMark(
                x: .value("Dia", "Miercoles"),
                y: .value("Pasos", 7290)
            )*/
        }
    }
}

#Preview {
    ContentView()
}
