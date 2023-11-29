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
            //1. Crearemos una HStack para el primer y segundo plan de suscripcion
            HStack {
                //2. Programaremos el plan bronce
                VStack{
                    Text("Plan Bronce")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.heavy)
                    Text("$9.99")
                        .font(.system(size: 35, weight: .heavy, design: .rounded))
                    Text("Acceso Mensual")
                        .font(.headline)
                }
                .padding()
                .background(Color.brown)
                .cornerRadius(15) //Redondeado
                
                //3. Crearemos la VStack para el plan plata
                VStack{
                    Text("Plan Plata")
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
                .padding()
                .background(Color(red: 220/255, green: 220/255, blue: 220/255))
                .cornerRadius(15)
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
