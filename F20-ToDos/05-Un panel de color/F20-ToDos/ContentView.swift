//
//  ContentView.swift
//  F20-ToDos
//
//  Created by Danilo Andrusco on 23-11-24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State var tasks: [Task] = []
    
    //MARK: Crear nueva tarea
    @State private var newTaskTitle: String = ""
    @State private var newTaskPriority: Priority = .normal
    @State private var showNewTask = false
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Lista de Tareas")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    Spacer()
                    Button(action: {
                        self.showNewTask = true
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.title)
                            .foregroundStyle(.teal)
                    })
                }
                .padding()
                
                List{
                    ForEach(self.tasks){task in
                        //TODO: representar la tarea en una fila
                    }
                }
                .listStyle(.plain)
                .rotation3DEffect(
                    Angle(degrees: self.showNewTask ? 8 : 0),
                    axis: (x:1, y:0, z:0))
                .offset(y: self.showNewTask ? -40 : 0)
                .animation(.easeInOut, value: self.showNewTask)
                .onAppear{
                    UITableView.appearance().separatorColor = .clear
                }
                
                if self.tasks.count == 0{
                    //1. Partiremos creando la vista vacia
                    NoTaskView()
                    
                }
                
                if self.showNewTask{
                   //TODO: Crear el formulario para generar una nueva tarea
                }
            }
        }
    }
}


#Preview {
    ContentView()
}

//2. Crearemos aca su funcionamiento
struct NoTaskView: View {
    var body: some View {
        //4. Creamos una VStack
        VStack{
            //5. En recuerdos esta una imagen llamada 630745-custom_site_themes-id-gvbz8gxZS3uFZqXanFAS_Award + Insignias (1), la arrastraremos a los Assets y la renombraremos a welcome
            //6. Metemos la imagen aqui
            Image("welcome")
                .resizable()
                .scaledToFill()
            //7. Creamos un texto
            Text("No hay tareas para mostrar todavía. Puedes crear una utilizando el botón de la esquina superior derecha")
                .font(.system(.headline, design: .rounded))
                .padding()
            //8. metemos un Spacer
            Spacer()
        }
    }
}

//3. Creamos su preview para ir viendo los cambios
#Preview("No task") {
    NoTaskView()
}
