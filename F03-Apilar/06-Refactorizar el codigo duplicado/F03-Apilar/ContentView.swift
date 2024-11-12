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
            HStack {
                //1. Como se puede apreciar ambas VStack para los dos planes son practicamente identica, solo cambia el texto y color a mostrar, seleccionaremos el primer VStack (bronce) y le daremos con boton derecho del mouse, seleccionaremos la opcion de Extraer Subview
                //11. Ahora la PriceView() por que no le hemos pasado los valores de las 5 variables
                PriceView(title: "Bronce", price: "$9.99", description: "Acceso Mensual", textColor: .white, backgroundColor: .brown)
                
                //12. LLamaremos nuevamente a al PriceView y llenaremos con los datos de la plata
                PriceView(title: "Plata", price: "$47.0", description: "Acceso Semestral", textColor: .black, backgroundColor: Color(red: 220/255, green: 220/255, blue: 220/255))
                //13. Ya podemos eliminar este VStack
                /*VStack{
                    Text("Plata")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.heavy)
                        .foregroundStyle(.black)
                    Text("$47.0")
                        .font(.system(size: 35, weight: .heavy, design: .rounded))
                        .foregroundStyle(.black)
                    Text("Acceso Semestral")
                        .font(.headline)
                        .foregroundStyle(.black)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight:100)
                .padding()
                .background(Color(red: 220/255, green: 220/255, blue: 220/255))
                .cornerRadius(15)*/
            }
            .padding(.horizontal)
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

//2. Le cambairemos el nombre
struct PriceView: View {
    //3. Como los planes no son iguales tendremos que crear 5 variables
    var title: String
    var price: String
    var description: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        VStack{
            //4. EN vez de Bronce, pondremos la variable title
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.heavy)
                //7. Agregaremos un foregroundStyle para el textColor
                .foregroundStyle(textColor)
            //5. En el $9.99 lo cambiamos por price
            Text(price)
                .font(.system(size: 35, weight: .heavy, design: .rounded))
                //8. Agregaremos un foregroundStyle para el textColor
                .foregroundStyle(textColor)
            //6. lo mismo con el acceso mensual por description
            Text(description)
                .font(.headline)
                //9. Agregaremos un foregroundStyle para el textColor
                .foregroundStyle(textColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight:100)
        .padding()
        //10. y para la caja cambiaremos el Color.brown por el backgroundColor
        .background(backgroundColor)
        .cornerRadius(15)
    }
}
