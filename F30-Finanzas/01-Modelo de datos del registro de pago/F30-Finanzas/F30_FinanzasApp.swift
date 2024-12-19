//
//  F30_FinanzasApp.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 19-12-24.
//

import SwiftUI
import SwiftData

@main
struct F30_FinanzasApp: App {
    //15. Eliminaremos las siguientes lineas
    /*var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            PaymentRecord.self,
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
        //16. Cambiamos el .modelContainer(sharedModelContainer) a .modelContainer(for: PaymentRecord.self)
        .modelContainer(for: PaymentRecord.self)
    }
}
