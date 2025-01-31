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
            Item.self,
            //3. Borramos el Song y el Albun creados anteriormente
            /*Song.self,
            Album.self,*/
            
            //4. Volvemos a la ContentView
            
            //13. Debemos añadir las tareas nuestro esquema
            Task.self
            //14. Ahora nos vamos a la ContentView
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
