//
//  ContentView.swift
//  F20-ToDosCoreData
//
//  Created by Danilo Andrusco on 23-11-24.
//

//1. Este archivo en el momento de crearlo y nombrarlo como F20-ToDos, en la interfaz seguimos ocupando SwiftUI pero en el Storage lo pasaremos a Core Data
//2. Core Data no es una BBDD es solo un Framework, que nos permite almacenar datos pero solo de manera local
//3. En La actualidad Apple propone implementar SwiftData
//4. Para trabajar en CoreData debemos entrr en el fichero llamado F20_ToDos que tiene un icono de BBDD, en la opcion de ATRIBUTE podemos ir creando nuestra BBDD
//5. Si revisamos el archivo principal de nuestra app llamado F20_ToDosApp vemos que la BBDD de Core Data arranca desde que se ejecuta nuesta app .environment(\.managedObjectContext, persistenceController.container.viewContext)
//6. Como Core Data ya esta quedando obsoleta, vamos a dejar hasta aqui y crearemos un nuevo proyecto pero esta sera con SwiftDate
import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
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
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
