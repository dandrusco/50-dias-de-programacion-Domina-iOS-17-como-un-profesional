//
//  BasicSheet.swift
//  F16-BottomSheet
//
//  Created by Danilo Andrusco on 28-05-24.
//

import SwiftUI

struct BasicSheet: View {
    
    @State private var showSheed = false
    
    var body: some View {
        Button("Mostrar Botton Sheet"){
            self.showSheed.toggle()
        }
        .buttonStyle(.bordered)
        .sheet(isPresented: self.$showSheed, content: {
            Text("Esto es un texto en la expandable bottom sheet.")
                .presentationDetents([.medium, .large])
        })
        Spacer()
    }
}

#Preview {
    BasicSheet()
}
