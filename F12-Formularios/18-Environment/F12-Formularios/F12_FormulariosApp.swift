//
//  F12_FormulariosApp.swift
//  F12-Formularios
//
//  Created by Danilo Andrusco on 02-04-24.
//

import SwiftUI

@main
struct F12_FormulariosApp: App {
    //14. Fuera del body le inyectaremos la dependencia del SettingsFactory()
    var settings = SettingsFactory()
    var body: some Scene {
        WindowGroup {
            //15 tambien deberemos borrar los settings y pasarle la variable creada por intermedio de un enviromentObject
            ContentView().environmentObject(self.settings)
        }
    }
}
