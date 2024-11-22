//
//  ContentView.swift
//  F19-Prestamos
//
//  Created by Danilo Andrusco on 21-11-24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var loanFactory = LoanFactory()
    
    //1. Crearemos dos estados, el primero para ver si mostramos o no el filtrado
    @State private var showFilter = false
    //2. El segundo para el valor maximo
    @State private var maxAmount = 1000.0
    
    var body: some View {
        NavigationStack{
            //3. Meteremos una VStack
            VStack{
                //4. Si el fintro esta activado? mostraremos los datos de acuerdo a los filtros
                if showFilter {
                    FilterView(maxLoan: self.$maxAmount)
                        //5La inscrustamos con una animacion
                        .transition(.opacity)
                }
                
                List(self.loanFactory.loans){ loan in
                    CellView(loan: loan)
                        .padding(.vertical, 8)
                }
                .navigationTitle("Préstamos de Kiva")
                //6. Crearemos el boton
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            //7. La configuracion del boton tendra una animacion
                            withAnimation(.linear){
                                //8. Cambiamos el estado de la variable booleana del showFilter
                                self.showFilter.toggle()
                                //9. Filtramos con el valor maximo que seleccione el usuario 
                                self.loanFactory.filterLoans(maxAmout: Int(self.maxAmount))
                            }
                        } label: {
                            //8. Creamos la imagen del boton
                            Image(systemName: "gear")
                                .font(.title)
                                .foregroundStyle(.teal)
                                .padding(16)
                                
                        }
                    }
                }
            }
        }
        .task {
            self.loanFactory.fetchFromApi()
        }
        
    }
}


#Preview {
    ContentView()
}
