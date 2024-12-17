//
//  Task.swift
//  F26-Actividad
//
//  Created by Danilo Andrusco on 17-12-24.
//

import Foundation

//3. Creamos la estructura de tipo Identifiable y Equatable, para poder ordenar y comparar
struct Task: Identifiable, Equatable {
    //4. Tendra un ID, un nombre y un progreso
    var id = UUID()
    var name = ""
    var progress: Double = 0.0 {
        //5. Cuando se configure, el progress pasara a tener el minimo entre progreses y 1.0 y el maximo entre 0.0. y el minimo calcualdo anteriormente
        didSet{
            progress = max(0.0, min(progress, 1.0))
        }
    }
    //6. Creamos el constructor
    init(name: String, progress: Double = 0.0){
        self.name = name
        self.progress = progress
    }
}

//7. Creamos la clase de las tareas observables
class TaskStore: ObservableObject {
    //8. sera obserbada, por lo tanto es @Published y contendra un arrays de tareas
    @Published var tasks = sampleTasks
}

//9. Creamos el arrays en un entorno de DEBUG
#if DEBUG
var sampleTasks = [
    Task(name: "KCal", progress: 0.23),
    Task(name: "Actividad", progress: 0.57),
    Task(name: "Horas de pie", progress: 0.1)
]
#endif
