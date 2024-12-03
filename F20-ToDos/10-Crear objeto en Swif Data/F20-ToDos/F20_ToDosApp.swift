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

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //1. AHora deberemos configurar el modelo en el arranque de la app
        .modelContainer(for: Task.self)
    }
}
