//
//  ContentView.swift
//  F20-ToDos
//
//  Created by Danilo Andrusco on 23-11-24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //10. AHora crearemos una variable de estado para nuestras tareas
    @State var tasks: [Task] = []
    
    //11. Crearemos dos estados para la creacion de tareas
    //MARK: Crear nueva tarea
    @State private var newTaskTitle: String = ""
    @State private var newTaskPriority: Priority = .normal
    @State private var showNewTask = false
    
    //1. Eliminaremos todo lo que nos proppone SwiftUI
    /*@Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]*/

    var body: some View {
        //2. Eiminaremos todo lo que nos da por defecto en el body
        /*NavigationSplitView {
         List {
         ForEach(items) { item in
         NavigationLink {
         Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
         } label: {
         Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
         }
         }
         .onDelete(perform: deleteItems)
         }
         .toolbar {
         ToolbarItem(placement: .navigationBarTrailing) {
         EditButton()
         }
         ToolbarItem {
         Button(action: addItem) {
         Label("Add Item", systemImage: "plus")
         }
         }
         }
         } detail: {
         Text("Select an item")
         }
         }
         
         private func addItem() {
         withAnimation {
         let newItem = Item(timestamp: Date())
         modelContext.insert(newItem)
         }
         }
         
         private func deleteItems(offsets: IndexSet) {
         withAnimation {
         for index in offsets {
         modelContext.delete(items[index])
         }
         }
         }*/
        
        //12. Crearemos una ZStack seguida de una VStack y seguida de una HStack
        ZStack{
            VStack{
                HStack{
                    //13. Creamos el titulo
                    Text("Lista de Tareas")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    Spacer()
                    //14. Creamos el boton
                    Button(action: {
                        self.showNewTask = true
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.title)
                            .foregroundStyle(.teal)
                    })
                }
                //15. Metemos un padding
                .padding()
                
                //16. Crearemos la lista de tareas a travez de ForEach
                List{
                    ForEach(self.tasks){task in
                        //TODO: representar la tarea en una fila
                    }
                }
                //17. Crearemos el estilo de la lista
                .listStyle(.plain)
                //18. Generaremos un efecto de angulo (inclinando cuando creamos una nueva tarea)
                .rotation3DEffect(
                    Angle(degrees: self.showNewTask ? 8 : 0),
                    axis: (x:1, y:0, z:0))
                //19 Aplicamos un offset para mover la lista unos 40 puntos en vertical
                .offset(y: self.showNewTask ? -40 : 0)
                //20. Todos estos cambios vamos a animarlos
                .animation(.easeInOut, value: self.showNewTask)
                //21. Junto cuando aparezca (onAppear) eliminaremos las lineas dvisorias
                .onAppear{
                    UITableView.appearance().separatorColor = .clear
                }
                
                //22. Si no hay tareas (count = 0)
                if self.tasks.count == 0{
                    //TODO: Creamos una vista vacia
                    
                }
                
                //23. SI hay que crear una nueva tarea
                if self.showNewTask{
                   //TODO: Crear el formulario para generar una nueva tarea
                }
            }
        }
    }
}
    //3. Tambien eliminamos el metodo que elimina items
    /*private func deleteTask(indexSet: IndexSet){
        for index in indexSet {
            let taskToDelete = self.tasks[index]
            self.modelContext.delete(taskToDelete)
        }
    }
    
}*/


#Preview {
    ContentView()
        //4. Eliminaremos el modelContainer
        /*.modelContainer(for: Item.self, inMemory: true)*/
}
//5. Y por ultimo nos cargaremos el archivo llamado Item
//6. Nos vamos al archivo F20_ToDosApp
