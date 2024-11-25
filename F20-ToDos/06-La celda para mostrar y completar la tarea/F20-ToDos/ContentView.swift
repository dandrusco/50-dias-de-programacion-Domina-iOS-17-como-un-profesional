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
                        //24. Ahora invocamos a la tarea
                        TaskCell(task: task)
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

struct NoTaskView: View {
    var body: some View {
        VStack{
            Image("welcome")
                .resizable()
                .scaledToFill()
            Text("No hay tareas para mostrar todavía. Puedes crear una utilizando el botón de la esquina superior derecha")
                .font(.system(.headline, design: .rounded))
                .padding()
            Spacer()
        }
    }
}
#Preview("No task") {
    NoTaskView()
}

//1. AHora crearemos la fila de las tareas
struct TaskCell: View {
    //2. Necesitamos una variable bindeable
    @Bindable var task: Task
    
    var body: some View{
        //3. Crearemos  un togle para cambiar el valor si se ha completado o no la tarea
        Toggle(isOn: self.$task.isCompleted) {
            //4. Creamos el diseño con una HStack
            HStack{
                //5. Creamos el titulo
                Text(self.task.title)
                    .font(.system(.callout, design: .rounded))
                    //6. SI esta completado lo tacharemos
                    .strikethrough(self.task.isCompleted, color: .teal)
                    .bold()
                    //7. La animacion sera por defecto
                    .animation(.default)
                //8. Metemos un Spacer
                Spacer()
                //9. Crearemos un circulo de 24x24
                Circle()
                    .frame(width: 24, height: 24)
                    //10. Crearemos una opcion para pintarlo, para ello nos vamos al archivo Taks
                    //14. Ahora si, atraves de un foregroundStyle llamamos al color segun la prioridad
                    .foregroundStyle(self.task.priority.color())
            }
        }
        //16. Para que esto se vea aun mejor crearemos un toggleStyle asociado a una estructura que llamaremos CheckboxStyle
        .toggleStyle(CheckboxStyle())
    }
}

//17. Programaremos la estructura que sea del tipo ToggleStyle
struct CheckboxStyle: ToggleStyle{
    
    //18. Implementaremos un metodo llamado makeBody con una configuracion que viene dada por la propia configuracion para diseñar una vista
    func makeBody(configuration: Self.Configuration) -> some View {
        //19. Devolveremos una HStack
        return HStack{
            //20. Pondremos una imagen y va a depender de la configuracion, si esta encidendido utlizamos el checkmark.circle, si no, un circulo vacio
            Image(systemName: configuration.isOn ? "checkmark.circle" : "circle")
                .resizable()
                .frame(width: 30, height: 30)
                //22 Configuramos el color en ambos casos
                .foregroundColor(configuration.isOn ? .teal : .gray)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                //23. Cuando lo cliqueamos cambiamos la configuracion del isOn
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
        }
    }
    
}
//15. Para ver los cambios crearemos una previw de pruebas
#Preview("Celda"){
    TaskCell(task: Task(title: "Prueba de la preview", priority: .high))
}

