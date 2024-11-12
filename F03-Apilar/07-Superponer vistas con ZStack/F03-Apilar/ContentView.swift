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
            //3. En la HStack le pondremos un spacer de 10 puntos para que se separe tanto la tarjeta del boronce como de la plata
            HStack (spacing: 10){
                PriceView(title: "Bronce", price: "$9.99", description: "Acceso Mensual", textColor: .black, backgroundColor: .brown)
                
                //1. Meteremos este PriceView en una Zstack
                ZStack {
                    PriceView(title: "Plata", price: "$48.0", description: "Acceso Semestral", textColor: .black, backgroundColor: Color(red: 220/255, green: 220/255, blue: 220/255))
                    
                    //2. Agregaremos un texto para que quede por encima de la PriceView
                    Text("Ahorra un 20%")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .background(Color.green)
                        .offset(x:0, y: -65)
                }
            }.padding(.horizontal)
            //4. Pondremos abajo el plan de oro dentro de una ZStack
            
            ZStack {
                //8. A la PriceView le agregaremos el icono
                PriceView(title: "Oro", price: "78.0", description: "Acceso Anual", textColor: .black, backgroundColor: Color(red: 255/255, green: 215/255, blue: 0/255), icon: "person.badge.shield.checkmark")
                    .padding(.horizontal)
                
                Text("Ahorra un 35%")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
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
    
    //5. Crearemos una variable para un icono de los SF Symbols, pero sera opcional ya que no todos los planes tendran ese icono, por lo tanto le debemos poner un ?
    var icon: String?
    
    var body: some View {
        VStack{
            //6. Pondremos la imagen aquí, pero deberemos chequear si el icono no es nulo
            if icon != nil {
                //7. SI hay icono lo mostraremos, pero deberemos ponerle un explamacion para que la variable deje de ser opcional (no nula)
                Image(systemName: icon!)
                    .font(.largeTitle)
                    .foregroundStyle(textColor)
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
