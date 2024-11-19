//
//  TransactionHistoryView.swift
//  F18-AppleWallet
//
//  Created by Danilo Andrusco on 12-11-24.
//

import SwiftUI

struct TransactionHistoryView: View {
    
    var currentTransactions: [Transaction]
    
    var body: some View {
        VStack() {
            Text("Historial de transacciones")
                .font(.system(size: 22, weight: .black, design: .rounded))
                .foregroundStyle(.teal)
                .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 24) {
                    ForEach(currentTransactions) {
                        transaction in
                        TransactionView(transaction: transaction)
                    }
                }
                .padding()
            }
        }
    }
}

struct TransactionView: View {
    var transaction: Transaction
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .foregroundStyle(.teal)
            .overlay(
                VStack() {
                    Spacer()
                    Image(systemName: transaction.icon)
                        .font(.system(size: 40))
                    Text(transaction.merchant)
                        .font(.system(.title3, design: .rounded))
                        .bold()
                    Text("\(String(format: "$%.2f", transaction.amount))")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .padding(8)
                    Text(transaction.date)
                        .font(.system(.caption, design: .rounded))
                    Spacer()
                }
                //24. Cambiaremos el color
                    .foregroundStyle(.white)
            )
            .frame(width: 200, height: 200)
    }
}

#Preview("Historial de transacciones") {
    TransactionHistoryView(currentTransactions: transactions)
}
