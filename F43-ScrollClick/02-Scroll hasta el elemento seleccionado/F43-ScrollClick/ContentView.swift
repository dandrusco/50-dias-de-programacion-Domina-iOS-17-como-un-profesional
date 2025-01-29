//
//  ContentView.swift
//  F43-ScrollClick
//
//  Created by Danilo Andrusco on 29-01-25.
//

import SwiftUI

struct ContentView: View {
    
    let colors: [Color] = [.indigo, .teal, .mint, .purple, .orange, .yellow]
    
    @State private var scrollID: Int?
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 16){
                ForEach(0...100, id: \.self) { idx in
                    self.colors[idx % self.colors.count]
                        .frame(height: 120)
                        .overlay {
                            Text("\(idx)")
                                .font(.system(size: 80, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            withAnimation {
                                //1. No funciona el idx para cuando se hace clic en el cuadrado 15 este se vaya hacia arriba
                                self.scrollID = idx
                            }
                        }
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(.horizontal, 16.0, for: .scrollContent)
        .scrollPosition(id: self.$scrollID)
        .onChange(of: self.scrollID) { oldValue, newValue in
            print(newValue ?? "")
        }
    }
}

#Preview {
    ContentView()
}
