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
            Circle()
                .stroke(Color(.systemGray4), lineWidth: 10)
                .frame(width: 200, height: 200)
            Circle()
                .trim(from: 0, to: 0.50)
                .stroke(.teal, lineWidth: 8)
                .frame(width: 200, height: 200)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(.linear(duration: 0.5).repeatForever(autoreverses: false), value: isLoading)
                .onAppear(){
                    isLoading = true
            }
        }
    }
}

#Preview {
    ContentView()
}
