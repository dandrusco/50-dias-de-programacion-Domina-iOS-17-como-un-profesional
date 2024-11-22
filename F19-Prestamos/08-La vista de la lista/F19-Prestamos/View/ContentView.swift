//
//  ContentView.swift
//  F19-Prestamos
//
//  Created by Danilo Andrusco on 21-11-24.
//

import SwiftUI

struct ContentView: View {
    
    //1. Crearemos una instancia de LiadFactory()
    @ObservedObject var loanFactory = LoanFactory()
    
    var body: some View {
        //2. Crearemos una NavigationStack
        NavigationStack{
           //3. Creamos la lista
            List(self.loanFactory.loans){ loan in
                //4. Ahora lo pintamos
                CellView(loan: loan)
                    .padding(.vertical, 8)
            }
            //5. Añadimos el titulo
            .navigationTitle("Préstamos de Kiva")
        }
        //6. Creamos una tarea para poder descargar la informacion
        .task {
            self.loanFactory.fetchFromApi()
        }
    }
}


#Preview {
    ContentView()
}
