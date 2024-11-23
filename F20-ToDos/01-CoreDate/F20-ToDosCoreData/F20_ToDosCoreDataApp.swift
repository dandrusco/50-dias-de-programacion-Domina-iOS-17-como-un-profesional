//
//  F20_ToDosCoreDataApp.swift
//  F20-ToDosCoreData
//
//  Created by Danilo Andrusco on 23-11-24.
//

import SwiftUI

@main
struct F20_ToDosCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
