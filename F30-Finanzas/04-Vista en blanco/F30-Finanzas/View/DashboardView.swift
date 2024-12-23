//
//  ContentView.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 19-12-24.
//


//1. Vamos a crear otro fichero de SwiftUI llamado BlankView

//7. Vamos a eliminar todos estos errores
import SwiftUI
import SwiftData

//11. La vamos a reenombrar a DashboardView
struct DashboardView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [PaymentRecord]

    var body: some View {
        //8. Eliminamos estas lineas
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
            let newItem = PaymentRecord(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }*/
        
        //9. Metemos aca la BlankView
        BlankView(bgColor: .teal)
        //10. La COntentView la meteremos en la carpeta View
    }
}

#Preview {
    DashboardView()
        .modelContainer(for: PaymentRecord.self, inMemory: true)
}
