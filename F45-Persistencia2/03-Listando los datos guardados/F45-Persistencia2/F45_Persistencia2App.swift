//
//  F45_Persistencia2App.swift
//  F45-Persistencia2
//
//  Created by Danilo Andrusco on 31-01-25.
//

import SwiftUI
import SwiftData

@main
struct F45_Persistencia2App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            //14. Eliminamos el Item
            /*Item.self,*/
            //15. Nos vamos a la ContentView
            Task.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
