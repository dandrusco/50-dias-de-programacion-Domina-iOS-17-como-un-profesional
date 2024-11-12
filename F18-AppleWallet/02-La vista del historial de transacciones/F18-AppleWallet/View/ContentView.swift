//
//  ContentView.swift
//  F18-AppleWallet
//
//  Created by Danilo Andrusco on 12-11-24.
//

//1. Crearemos un nuevo fichero en File from temple de tipo Swift UI que lo llamaremos TransactionHistoryView, el cual nos permitira realizar el historial de pagos

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
