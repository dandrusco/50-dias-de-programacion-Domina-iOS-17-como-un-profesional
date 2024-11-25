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
                    //8. Lo implementaremos con el color teal, con una opacidad del 0.4 y cuando cliquemos en el cambiamos la variable del showNewTask a falso
                    BlackView(backgroundColor: .teal)
                        .opacity(0.4)
                        .onTapGesture {
                            self.showNewTask = false
                        }
                    //9. Si cliqueamos el boton + se nos despliega un velo por dejajo, si precionamos en el, desaparece
                    //10. Para ordenar el codigo crearemos una carpeta llamada View y meteremos la COntentView en el
                    //11. Dentro de esta carpeta crearemos un nuevo fichero de SwiftUI llamado NewTaskView
                    
                    //15. llamamos a la NewTaskView con todos sus parametros
                    NewTaskView(isShow: self.$showNewTask, task: self.$tasks, title: "", priority: .normal)
                        //16. La trancicion la traeremos desde abajo
                        .transition(.move(edge: .bottom))
                        //16 La animacion sera la de interpolatingSpring
                        .animation(.interpolatingSpring(stiffness: 180.0, damping: 20.0, initialVelocity: 12.0), value: self.showNewTask)
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

struct TaskCell: View {
    
    @Bindable var task: Task
    
    var body: some View{
        Toggle(isOn: self.$task.isCompleted) {
            HStack{
                Text(self.task.title)
                    .font(.system(.callout, design: .rounded))
                    .strikethrough(self.task.isCompleted, color: .teal)
                    .bold()
                    .animation(.default)
                Spacer()
                Circle()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(self.task.priority.color())
            }
        }
        .toggleStyle(CheckboxStyle())
    }
}

struct CheckboxStyle: ToggleStyle{
    
    func makeBody(configuration: Self.Configuration) -> some View {
        return HStack{
            Image(systemName: configuration.isOn ? "checkmark.circle" : "circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(configuration.isOn ? .teal : .gray)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
        }
    }
    
}
#Preview("Celda"){
    TaskCell(task: Task(title: "Prueba de la preview", priority: .high))
}

//1. Nos toca mostrar el formurario por la vista principal que nos permita crear una nueva tarea
//2. Para ello crearemos un "velo" para ocultar lo que hay por debajo
struct BlackView: View {
    //3. Tendra un color
    var backgroundColor: Color
    
    var body: some View {
        //4. Metemos una VStack que solo contenga un Spacer
        VStack{
            Spacer()
        }
        //5. Ahora configuraremos el frame
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        //6. Le cambiamos el color por el que hemos configurado
        .background(self.backgroundColor)
        //7. Y para que ignore cualquier tipo de margen
        .edgesIgnoringSafeArea(.all)
    }
}

