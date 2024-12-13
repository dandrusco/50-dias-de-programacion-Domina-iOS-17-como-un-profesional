//
//  ContentView.swift
//  F26-Actividad
//
//  Created by Danilo Andrusco on 13-12-24.
//

//1. Creamos un nuevo fichero de SwiftUI llamado ProgressRing
//2. Acontinuacion crearemos otro fichero de de SwiftUI llamado Color+Extension (Si la sintaxis es correcta, se puede poner un signo mas)
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
