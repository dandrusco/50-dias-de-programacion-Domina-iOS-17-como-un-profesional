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
    
    //1. Creamos una variable de estado opcional para ver si el usuario a seleccionado un curso
    @State private var selectedCount: Int?
    //13. Creamos una variable de estado opcional para el sector seleccionado en principo String opcional
    @State private var selectedSector: String?
    
    
    var body: some View {
        VStack {
            Chart{
                ForEach(self.sales, id: \.name){ course in
                    SectorMark(
                        angle: .value("Ventas", course.count),
                        innerRadius: .ratio(0.6),
                        outerRadius: course.name == "Unity" ? 160 : 140,
                        angularInset: 2.0
                    )
                    .foregroundStyle(by: .value("Nombre", course.name))
                    .cornerRadius(5.0)
                    //17. la idea es que al momento de dejar precionado sobre un "queso" el resto se ponga opaco, por lo tanto programamos la opacidad, por lo tanto si selectedSector es nulo, lo pintamos 100% opaco, sino, añadiremos un segundo caso, si selectedSector es igual a los cursos lo pintaremos a 100% opaco, de lo contrario al 50%
                    .opacity(self.selectedSector == nil ? 1.0 : (self.selectedSector == course.name ? 1.0 : 0.5))
                    .annotation(position: .overlay) {
                        Text("\(course.count)")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
            }
            .frame(height: 400)
            .chartBackground { proxy in
                Text("📚")
                    .font(.system(size: 80))
            }
            //2. Con chartAngleSelection bindeamos la variable de estado creada anteriormente
            .chartAngleSelection(value: self.$selectedCount)
            //3. Con onChange podemos detectar cambios en la variable selectedCount
            .onChange(of: self.selectedCount) { oldValue, newValue in
                //4. El onChange tiene el valor nuevo y valor viejo, si el valor nuevo existe...
                if let newValue {
                    //5. Imnprimiremos por pantalla el nuevo valor
                    //16. Comentaremos el print
                    /*print(newValue)*/
                    //6. Como podemos apreciar por pantalla no nos muestra el valor si no el punto de referencia, si nos movemos mas a la derecha o ala izquierda este valor cambia
                    //14. en la variable de estado selectedSector nos quedaremos con el return de la funcion findSectora a partir del newValue
                    self.selectedSector = self.findSector(value: newValue)
                //15. de lo contrareo sera nulo
                } else {
                    //18. Si lo que queremos es que al soltar el dedo estos sigan opaco?, comentamos esta linea
                    self.selectedSector = nil
                }
            }
        }
        .padding()
    }
    
    //7. Creamos una funcion para la seleccion del usuario, a partir de un valir entero y devolvera un string opcional con el nombre del curso
    private func findSector(value: Int) -> String? {
        //8. Creamos una variable para la acomulacion de estos numeros
        var accumulated = 0
        //9. Obtendremos el primer elemento de la coleccion que cumplan una determinada condicion, nos quedaremos con el count
        let course = self.sales.first { (_, count) in
            //10. Comenzaremos a acomular el count
            accumulated += count
            //11. devolveremos el valor menos o igual al acomulado
            return value <= accumulated
        }
        //12. devolvemos el nombre del curso opcional
        return course?.name
    }
}

#Preview {
    ContentView()
}
