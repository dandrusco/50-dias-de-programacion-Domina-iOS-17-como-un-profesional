//
//  ContentView.swift
//  F45-Persistencia2
//
//  Created by Danilo Andrusco on 31-01-25.
//

//1. Vamos a diseñar la interfaz de usuario
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    //2. El arrays de Items lo cambiaremos por el arrays de Tareas
    @Query private var tasks: [Task]

    var body: some View {
        //3. Eliminaremos esto que no nos servira
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
        }*/
        
        //6. Pondremos una NavigationStack y en su interior una lista de objetos
        NavigationStack{
            List{
                //7. Vamos a hacer un ForEach para la lista de tareas
                ForEach(self.tasks){ task in
                    //8. metemos una HStack para meter un texto con el nombre de las tareas
                    HStack{
                        Text(task.name)
                        //9. Ponemos un Spacer
                        Spacer()
                        //10. Si la tarea ha sido completada le pondremos un check
                        if(task.completed){
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
            //11. Le pondremos un titulo
            .navigationTitle("Lista de Tareas")
            //12. Ahora podemos eliminar el archivo llamado Item
            //13. Nos vamos al F45_Persistencia2App
        }
    }

    private func addItem() {
        //4. Eliminaremos esto tambien
        /*withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }*/
        //TODO: Añadir tareas a la BBDD
    }
    private func deleteItems(offsets: IndexSet) {
        //5. Tambien eliminamos esta
        /*withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }*/
        //TODO: Eliminar tareas de la BBDD
    }
    
    private func generateRandomTask() -> Task {
 
        let tasks = ["Comprar verduras", "Terminar los deberes", "Estudiar curso de iOS", "Ir a clase de Yoga", "Leer una novela", "Escribir un post del blog", "Limpiar la casa", "Atender una llamada", "Grabar episodio del podcast"]
        
        let rndIndex = Int.random(in: 0..<tasks.count)
        let rndTask = tasks[rndIndex]
        
        return Task(name: rndTask, completed: Bool.random())
        
    }
}

#Preview {
    ContentView()
        //16. Corregimos este error cambiando el Items por las tareas
        .modelContainer(for: Task.self, inMemory: true)
}
