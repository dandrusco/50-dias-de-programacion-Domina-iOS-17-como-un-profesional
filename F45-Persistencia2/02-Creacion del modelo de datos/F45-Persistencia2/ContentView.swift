//
//  ContentView.swift
//  F45-Persistencia2
//
//  Created by Danilo Andrusco on 31-01-25.
//

//1. Como todo lo que creamos era de manera introductiva, vamos a eliminar el archivo de Album y de Song
//2. Nos vamos al F45_Persistencia2App
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    //5. Descomentamos esta Query
    @Query private var items: [Item]
    
    //6. Eliminamos esta...
    /*@Query(sort: \.artist, order: .reverse) var songs: [Song]*/
    
    //7. Ahora deberemos crear el Modelo, dentro de la carpeta Model crearemos un fichero de Swift File llamado Task (Tareas)

    var body: some View {
        NavigationSplitView {
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
    }
    
    //15. Crearemos una funcion para crear el contenido de los datos, el cual devolvera una tarea
    private func generateRandomTask() -> Task {
        //16. Creamos una arrays de tareas
        let tasks = ["Comprar verduras", "Terminar los deberes", "Estudiar curso de iOS", "Ir a clase de Yoga", "Leer una novela", "Escribir un post del blog", "Limpiar la casa", "Atender una llamada", "Grabar episodio del podcast"]
        
        //17. Creamos un random para el index, que va desde cero hasta menos que las tareas
        let rndIndex = Int.random(in: 0..<tasks.count)
        //18. Creamos las tareas aleatorias
        let rndTask = tasks[rndIndex]
        
        //19. Devolvemos las taras, con el nombre y el parametro si esta completo sera de tipo random, obteniendo algunas true como false
        return Task(name: rndTask, completed: Bool.random())
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
