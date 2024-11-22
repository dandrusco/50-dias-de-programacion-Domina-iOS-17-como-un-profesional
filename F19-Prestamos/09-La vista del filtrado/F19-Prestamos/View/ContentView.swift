//
//  ContentView.swift
//  F19-Prestamos
//
//  Created by Danilo Andrusco on 21-11-24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var loanFactory = LoanFactory()
    
    var body: some View {
        NavigationStack{
            List(self.loanFactory.loans){ loan in
                CellView(loan: loan)
                    .padding(.vertical, 8)
            }
            .navigationTitle("Préstamos de Kiva")
        }
        .task {
            self.loanFactory.fetchFromApi()
        }
    }
}


#Preview {
    ContentView()
}
