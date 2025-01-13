//
//  ContentView.swift
//  F38-Cuadricula
//
//  Created by Danilo Andrusco on 13-01-25.
//

//1. Vamos a implementar otro ejemplo, para ello crearemos un nuevo fichero de SwiftUI llamado BlankView
import SwiftUI

struct ContentView: View {
    var body: some View {
        Grid{
            GridRow{
                Color.red
                Color.green
                Color.purple
            }
            GridRow{
                Color.yellow
                Color.blue
                Color.teal
            }
            GridRow{
                Color.brown
                Color.orange
                Color.mint
            }
        }
    }
}
#Preview {
    ContentView()
}
