//
//  ContentView.swift
//  F05-Botones
//
//  Created by Danilo Andrusco on 05-12-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button{
            print("Pulsé el boton")
        } label: {
            Text("Hola Mundo!")
                .foregroundStyle(.black)
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .background(Color.green)
                .cornerRadius(40)
                .padding(10)
                //1. Para que no nos quede el cornerRadius cortado deberemos eliminar tanto el border como el cornerRadius e implementar un overlay
                /*.border(Color.green, width: 4)
                .cornerRadius(40)*/
                .overlay{
                    RoundedRectangle(cornerRadius: 40)
                    //2. Pintamos solo el borde con stroke
                        .stroke(.green, lineWidth: 4)
                }
        }
    }
}

#Preview {
    ContentView()
}
