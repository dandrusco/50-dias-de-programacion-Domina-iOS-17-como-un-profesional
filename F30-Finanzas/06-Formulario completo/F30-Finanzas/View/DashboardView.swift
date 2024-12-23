//
//  ContentView.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 19-12-24.
//

import SwiftUI
import SwiftData

struct DashboardView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [PaymentRecord]

    var body: some View {

        BlankView(bgColor: .teal)
    }
}

#Preview {
    DashboardView()
        .modelContainer(for: PaymentRecord.self, inMemory: true)
}
