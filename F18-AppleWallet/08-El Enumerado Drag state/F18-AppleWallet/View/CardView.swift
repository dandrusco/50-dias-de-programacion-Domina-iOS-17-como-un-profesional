//
//  CardView.swift
//  F18-AppleWallet
//
//  Created by Danilo Andrusco on 15-11-24.
//

import SwiftUI

struct CardView: View {
    var card : Card
    
    var body: some View {
        Image(card.image)
            .resizable()
            .scaledToFit()
            .overlay(
                VStack(alignment: .leading) {
                    Text(card.number)
                        .bold()
                    HStack {
                        Text(card.name)
                            .font(.callout)
                        Text(card.expirationDate)
                            .font(.caption)
                    }
                }
                .foregroundStyle(.white)
                .padding(.leading, 24)
                .padding(.bottom, 24)
                , alignment: .bottomLeading
            )
            .shadow(color: .gray, radius: 5, x: 0, y: 1)
    }
}

#Preview {
    CardView(card: cards[0])
}
