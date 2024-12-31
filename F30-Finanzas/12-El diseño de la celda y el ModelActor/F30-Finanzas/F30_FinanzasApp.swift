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
    
    let modelContainer: ModelContainer

    init() {
        do {
            modelContainer = try ModelContainer(for: PaymentRecord.self)
        } catch {
            fatalError("No se ha podido inicializar el Model Container")
        }
    }
    

    var body: some Scene {
        WindowGroup {
            DashboardView()
        }.modelContainer(modelContainer)
    }
}
