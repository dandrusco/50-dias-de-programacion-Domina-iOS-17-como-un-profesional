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
                    BlackView(backgroundColor: .teal)
                        .opacity(0.4)
                        .onTapGesture {
                            self.showNewTask = false
                        }
                    //7. Aqui donde le pasamos el arrays de tareas debemos modificvarlo, eliminadndo task: self.$tasks,
                    NewTaskView(isShow: self.$showNewTask, title: "", priority: .normal)
                        .transition(.move(edge: .bottom))
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


struct BlackView: View {
    
    var backgroundColor: Color
    
    var body: some View {
        VStack{
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(self.backgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
}
