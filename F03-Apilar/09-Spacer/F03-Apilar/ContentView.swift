//
//  ContentView.swift
//  F03-Apilar
//
//  Created by Danilo Andrusco on 28-11-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TitileView()
            
            HStack (spacing: 10){
                PriceView(title: "Bronce", price: "$9.99", description: "Acceso Mensual", textColor: .black, backgroundColor: .brown)
                
                ZStack {
                    PriceView(title: "Plata", price: "$48.0", description: "Acceso Semestral", textColor: .black, backgroundColor: Color(red: 220/255, green: 220/255, blue: 220/255))
                    
                    Text("Ahorra un 20%")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .background(Color.green)
                        .offset(x:0, y: -65)
                }
            }.padding(.horizontal)
            
            ZStack {
                PriceView(title: "Oro", price: "78.0", description: "Acceso Anual", textColor: .black, backgroundColor: Color(red: 255/255, green: 215/255, blue: 0/255), icon: "lightbulb.max.fill")
                    .padding()
                
                Text("Ahorra un 35%")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .padding(6)
                    .background(Color.green)
                    .offset(x:0, y: -85)
            }
            //4. PAra tirar TODOO para arriba le podemos poner un spacer al final
            Spacer()
            
        }
    }
}

#Preview {
    ContentView()
}

struct TitileView: View {
    var body: some View {
        //1. Vamos a poner el titulo hacia la izquiera, para ello deberemos poner la VStack dentro de una HStack
        HStack {
            VStack (alignment: .leading, spacing: 5) {
                Text("Elige")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                Text("Tu suscripción")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
            }
            //2. Ahora pondremos un Spacer para tirar toda la VStack hacia la izquierda
            Spacer()
        }
        //3. Para que el titulo respire mejor le añadiremos un padding
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
