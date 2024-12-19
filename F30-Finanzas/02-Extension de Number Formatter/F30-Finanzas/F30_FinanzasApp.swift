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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: PaymentRecord.self)
    }
}
