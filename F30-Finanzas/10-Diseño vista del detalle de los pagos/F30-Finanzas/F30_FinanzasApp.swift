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
    
    //24. creamos el modelContainer de tipo ModelContainer
    let modelContainer: ModelContainer
    //25. Creamos un init con un do
    init() {
        do {
            //26. Ahora el modelContainer lo inicializamos como try ModelContainer de la clase PaymentRecord
            modelContainer = try ModelContainer(for: PaymentRecord.self)
        } catch {
            //27. Capturamos el error
            fatalError("No se ha podido inicializar el Model Container")
        }
    }
    

    var body: some Scene {
        WindowGroup {
            DashboardView()
        }
        //28. AHora en vez de meter PaymentRecord asi: for: PaymentRecord.self, ahora le pasamos el modelContainer
        .modelContainer(modelContainer)
        //29. Ahora nos vamos a la PaymentDetailView
    }
}
