//
//  ContentView.swift
//  F38-Cuadricula
//
//  Created by Danilo Andrusco on 13-01-25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1. Para crear unas cuadriculas utilizamos Grid a contar de iOS 16
        Grid{
            //2. Vamos a crear una fila con 3 columnas las cuales pintaremos con distintos colores
            GridRow{
                Color.red
                Color.green
                Color.purple
            }
            //3. Podemos meter otra fila con 3 columnas mas
            GridRow{
                Color.yellow
                Color.blue
                Color.teal
            }
            //4. Y si queremos otra fila con 3 columnas mas
            GridRow{
                Color.brown
                Color.orange
                Color.mint
            //5. Por que utilizar Grid en lugar de HStacak  con VStack? Bueno crearemos un nuevo fichero de SwiftUI llamado ColorsAndSymbolsView para aclararlo 
            }
        }
    }
}
#Preview {
    ContentView()
}
