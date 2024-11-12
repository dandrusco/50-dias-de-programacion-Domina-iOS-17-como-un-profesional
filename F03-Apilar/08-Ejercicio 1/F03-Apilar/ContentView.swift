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
                    //5. Le pondremos un .padding()
                    .padding()
                
                Text("Ahorra un 35%")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    //6. Le pondremos un .padding() para agrandar la caja del descuento
                    .padding(6)
                    .background(Color.green)
                    .offset(x:0, y: -85)
            }
            
        }
    }
}

#Preview {
    ContentView()
}

struct TitileView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("Elige")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
            Text("Tu suscripción")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
        }
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
            //1. Vamos a comentar este IF
            /*if icon != nil {
                Image(systemName: icon!)
                    .font(.largeTitle)
                    .foregroundStyle(textColor)
            }*/
            
            //2. Otra forma de conversion de una variable opcional es crear una constante a partir de que solamente tomara valor si la variable opcional icon tiene valor, a travez del IF
            if let icon = icon {
                //3. La exclamacion de icon ya no es necesaria
                Image(systemName: icon)
                    .font(.largeTitle)
                    //4. Dejaremos la imagen en blanco por defecto
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
