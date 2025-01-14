//
//  ContentView.swift
//  F40-Mapas
//
//  Created by Danilo Andrusco on 14-01-25.
//

import SwiftUI
//1. Lo primero es importar MapKit si queremos utilizar los mapas
import MapKit

struct ContentView: View {
    var body: some View {
       //2. Para añadir un mapa simplemente llamaos a Map
        Map()
    }
    
    
    
}

#Preview {
    ContentView()
}
