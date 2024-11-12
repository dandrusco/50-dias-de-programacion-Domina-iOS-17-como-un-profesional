//
//  ContentView.swift
//  F03-Apilar
//
//  Created by Danilo Andrusco on 28-11-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            PriceView(title: "Bronce", price: "$9.99", description: "Acceso Mensual", textColor: .black, backgroundColor: .brown)
                .padding()
                .offset(x:0, y: 110)
            
            PriceView(title: "Plata", price: "$48.0", description: "Acceso Semestral", textColor: .black, backgroundColor: Color(red: 220/255, green: 220/255, blue: 220/255))
                .padding()
                .scaleEffect(0.9)
            
            PriceView(title: "Oro", price: "78.0", description: "Acceso Anual", textColor: .black, backgroundColor: Color(red: 255/255, green: 215/255, blue: 0/255), icon: "lightbulb.max.fill")
                .padding()
                .scaleEffect(0.8)
                .offset(x:0, y: -120)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct TitileView: View {
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 5) {
                Text("Elige")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                Text("Tu suscripción")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
            }
            Spacer()
        }
        .padding()
    }
}

struct PriceView: View {

    var title: String
    var price: String
    var description: String
    var textColor: Color
    var backgroundColor: Color
    var icon: String?
    
    var body: some View {
        VStack{
            if let icon = icon {
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.heavy)
                .foregroundStyle(textColor)
            Text(price)
                .font(.system(size: 35, weight: .heavy, design: .rounded))
                .foregroundStyle(textColor)
            Text(description)
                .font(.headline)
                .foregroundStyle(textColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight:100)
        .padding()
        .background(backgroundColor)
        .cornerRadius(15)
    }
}
