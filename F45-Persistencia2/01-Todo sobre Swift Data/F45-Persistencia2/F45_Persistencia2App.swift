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
        //17. El ModelContainer sirve como backend de persistencia para los tipo de datos del modelos que queremos que se guarden, se crea en la propia aplicacion
        
        //19. Se crea a traves de un esquema
        let schema = Schema([
            Item.self,
            //20. Podemos meterle el Song y el Album creados anteriormente
            Song.self,
            Album.self,
        ])
        //21. Aqui configuramos el modelo, podemos guardarlo en una URL por ejemplo
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
        //18. Lo metemos en la propia vista de la aplicacion
        .modelContainer(sharedModelContainer)
    }
}

//22. Si el Modelo es el BackEnd, el contexto es la interface, para ello nos vamos a la ContentView
