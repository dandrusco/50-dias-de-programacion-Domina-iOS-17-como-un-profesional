//
//  F12_FormulariosApp.swift
//  F12-Formularios
//
//  Created by Danilo Andrusco on 02-04-24.
//

import SwiftUI

@main
struct F12_FormulariosApp: App {
    var settings = SettingsFactory()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(self.settings)
        }
    }
}
