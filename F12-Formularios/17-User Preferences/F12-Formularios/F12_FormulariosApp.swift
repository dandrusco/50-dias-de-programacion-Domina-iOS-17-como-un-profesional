//
//  F12_FormulariosApp.swift
//  F12-Formularios
//
//  Created by Danilo Andrusco on 02-04-24.
//

import SwiftUI

@main
struct F12_FormulariosApp: App {
    var body: some Scene {
        WindowGroup {
            //13. Corregimos aqui
            ContentView(settings: SettingsFactory())
        }
    }
}
