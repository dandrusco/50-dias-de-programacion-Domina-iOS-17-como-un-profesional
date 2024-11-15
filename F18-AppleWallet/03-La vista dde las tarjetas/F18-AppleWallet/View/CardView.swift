//
//  CardView.swift
//  F18-AppleWallet
//
//  Created by Danilo Andrusco on 15-11-24.
//

import SwiftUI

struct CardView: View {
    //2. Creamos una variable que sera de tipo Card
    var card : Card
    
    var body: some View {
        //3. Comenzaremos a crear el diseño
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
            //4. Crearemos una sombra a la tarjeta
            .shadow(color: .gray, radius: 5, x: 0, y: 1)
    }
}

#Preview {
    //3. Le pasaremos las card, de las cards que tengamos disponibles, pero solo la primera de ellas
    CardView(card: cards[0])
}
