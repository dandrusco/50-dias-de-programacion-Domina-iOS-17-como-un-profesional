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
                VStack{
                    //3. Le cambiaremos solo a Brnce para que calce mejor
                    Text("Bronce")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.heavy)
                    Text("$9.99")
                        .font(.system(size: 35, weight: .heavy, design: .rounded))
                    Text("Acceso Mensual")
                        .font(.headline)
                }
                //1. Para que cada plan tenga el mismo tamaño deberemos poner un frame indicandole la minima anchura y altura y la maxima anchura
                .frame(minWidth: 0, maxWidth: .infinity, minHeight:100)
                .padding()
                .background(Color.brown)
                .cornerRadius(15) //Redondeado
                
                VStack{
                    //4. y aqui lo dejaremos solo a plata
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
                //2. Los mismo para el plan plata
                .frame(minWidth: 0, maxWidth: .infinity, minHeight:100)
                .padding()
                .background(Color(red: 220/255, green: 220/255, blue: 220/255))
                .cornerRadius(15)
            }
            //5. Le meteremos un padding horizontal para que respire mejor ambos planes
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
