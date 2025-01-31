//
//  ContentView.swift
//  F45-Persistencia2
//
//  Created by Danilo Andrusco on 31-01-25.
//

//1. El proyecto debemos crearlo en Storage como SwiftData
//2. Creamos una carpeta llamada Model
//3. Dentro de esta carpeta crearemos un fichero de Swift File llamado Song
import SwiftUI
import SwiftData

struct ContentView: View {
    //23. Debemos tener el conexto dentro de una variable de entorno, una @Environment
    @Environment(\.modelContext) private var modelContext
    //24. Con la @Query obtenemos los datos almacenados ne la BBDD, la vamos a comentar para crear una propia
    /*@Query private var items: [Item]*/
    
    //25. creamos una @Query ordenado por artistas, y que lo ordende .reverse del array de canciones
    @Query(sort: \.artist, order: .reverse) var songs: [Song]

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
            //26. Aqui podemos crear unos artistas, albunes, etc.
            let newItem = Item(timestamp: Date())
            //27. Aqui se lo insertamos
            modelContext.insert(newItem)
        }
    }
    //28. Aqui podemos borrar
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                //29. Del modelContext se borran los items en cuestion, a traves de una busqueda
                modelContext.delete(items[index])
            }
        }
    }
}
//30. Nos nos preocupemos por los errores ya que es solo de manera introductiva

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
