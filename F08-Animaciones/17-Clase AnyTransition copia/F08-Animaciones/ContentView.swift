//
//  ContentView.swift
//  F08-Animaciones
//
//  Created by Danilo Andrusco on 05-01-24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showDetails = false
        
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 250, height: 250)
                .foregroundStyle(.teal)
                .overlay(
                    Text("Ver detalles")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundStyle(.white)
                )
            
            if showDetails {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 250, height: 250)
                    .foregroundStyle(.green)
                    .overlay(
                        Text("Estas viendo la vista del detalle")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundStyle(.white)
                            .padding()
                    )
                    //4. Ahora solamente la transition debera incovar la offsetScaleOpacity
                    .transition(.offsetScaleOpacity)
            }
        }
        .onTapGesture {
            withAnimation(.default){
                showDetails.toggle()
            }
        }
    }
}

//1. Podemos reutilizar esta transicion a traves de una extension de la clase AnyTransision
extension AnyTransition {
    //2. Declareremos una variable estatica de tipo AnyTransition
    static var offsetScaleOpacity: AnyTransition {
        //3. A traves de AnyTransition le pegaremos las  3 animaciones ya creadas
        AnyTransition
            .offset(x: 600, y: 0)
            .combined(with: .scale(scale: 0, anchor: .top))
            .combined(with: .opacity)
    }
}

#Preview {
    ContentView()
}
