//
//  ContentView.swift
//  F06-Estados
//
//  Created by Danilo Andrusco on 11-12-23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var clicker = 0

    var body: some View {
        VStack {
            Button{
                clicker += 1
            } label: {
                Text("\(clicker)")
                    .font(.system(size: 80))
                    .foregroundStyle(.black)
            }
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 80))
        .controlSize(.large)
        .padding()
    }
}

#Preview {
    ContentView()
}
