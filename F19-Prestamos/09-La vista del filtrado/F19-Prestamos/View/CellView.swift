//
//  CellView.swift
//  F19-Prestamos
//
//  Created by Danilo Andrusco on 22-11-24.
//

import SwiftUI

struct CellView: View {

    var loan: Loan
    
    var body: some View {
        HStack(alignment: .center){
            VStack(alignment: .leading, content: {
                Text(loan.name)
                    .font(.system(.headline, design: .rounded))
                    .bold()
                    .foregroundStyle(.teal)

                Text(loan.country)
                    .font(.system(.subheadline, design: .rounded))

                Text(loan.use)
                    .font(.system(.caption, design: .rounded))
            })

            Spacer()
            
                Text("US \(loan.amount)")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundStyle(.teal)
                    
        }
        .padding()
    }
}

#Preview {
    CellView(loan: Loan(name: "Danilo Andrusco", country: "Chile", use: "Para comprar un iPhone", amount: 999))
}
