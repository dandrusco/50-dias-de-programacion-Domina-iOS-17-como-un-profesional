//
//  CardView.swift
//  F04-ScrollViews
//
//  Created by Danilo Andrusco on 04-12-23.
//

import SwiftUI

struct CardView: View {

    var image: String
    var title: String
    var description: String
    var level: String
    
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
    
            VStack(alignment: .leading){
                Text(title)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundStyle(.secondary)
                //7. Le pondremos un modificador para evitar cortes en el titulo, escalandolo a un 40%
                    .minimumScaleFactor(0.4)
                
                Text(description)
                    .font(.title2)
                    .foregroundStyle(.primary)
                    .lineLimit(3)
                
                Text(level)
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(.sRGB, red: 140/255, green: 140/255, blue: 140/255, opacity: 0.6), lineWidth: 2)
        )
        .padding([.top, .horizontal])
    }
}

#Preview {
    CardView(image: "swift5", title: "Curso de Swift 5", description: "Aprende el lenguaje de programacion de Apple desde cero", level: "Nivel facil")
}
