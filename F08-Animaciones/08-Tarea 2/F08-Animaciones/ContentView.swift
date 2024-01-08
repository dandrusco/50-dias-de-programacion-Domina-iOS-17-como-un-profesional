//
//  ContentView.swift
//  F08-Animaciones
//
//  Created by Danilo Andrusco on 05-01-24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Text("Cargando")
                .font(.system(.title, design: .rounded))
                .bold()
                .offset(x:0, y: -30)
            
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color(.systemGray2), lineWidth: 5)
                .frame(width: 300, height: 5)
            
            RoundedRectangle(cornerRadius: 5)
                .stroke(.teal, lineWidth: 5)
                .frame(width: 30, height: 5)
                .offset(x: isLoading ? 135 : -135)
                .animation(.linear(duration: 2).repeatForever(autoreverses:false), value: isLoading)
        }
        .onAppear(){
            isLoading = true
        }
    }
}

#Preview {
    ContentView()
}
