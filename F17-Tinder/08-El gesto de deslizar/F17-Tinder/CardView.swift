//
//  CardView.swift
//  F17-Tinder
//
//  Created by Danilo Andrusco on 20-08-24.
//

import SwiftUI

struct CardView: View, Identifiable {
    
    let id = UUID()
    let name: String
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .cornerRadius(24)
            .padding(.horizontal, 24)
            .overlay(alignment: .bottom){
                Text(name)
                    .font(.system(.title2, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .background(.teal)
                    .cornerRadius(16)
                    .padding(.bottom, 24)
                    .padding(.horizontal, 32)
            }
        
    }
}

#Preview {
    CardView(name: "Curso de Algebra Lineal", image: "algebralineal")
}
