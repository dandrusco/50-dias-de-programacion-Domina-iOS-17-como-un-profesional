//
//  F20_ToDosApp.swift
//  F20-ToDos
//
//  Created by Danilo Andrusco on 23-11-24.
//

import SwiftUI
import SwiftData

@main
struct F20_ToDosApp: App {
    //7.Eliminamos este sharedModelContainer
    /*var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()*/

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //8. Y por ultimo eliminamos el modelContainer
        /*.modelContainer(sharedModelContainer)*/
        //9. Volvemos a la ContentView
    }
}
