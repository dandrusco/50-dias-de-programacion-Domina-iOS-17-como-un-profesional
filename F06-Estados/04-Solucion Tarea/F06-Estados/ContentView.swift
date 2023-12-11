//
//  ContentView.swift
//  F06-Estados
//
//  Created by Danilo Andrusco on 11-12-23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var counter = 0

    var body: some View {
        VStack {
            Button{
                counter += 1
            } label: {
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.cyan)
                    .overlay(
                        Text("\(counter)")
                            .font(.system(size: 60, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                )
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
