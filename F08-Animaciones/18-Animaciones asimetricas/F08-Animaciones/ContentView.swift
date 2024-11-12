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
                    //1. Para ocupar una trasicion asimetrica deberemos modificar esta linea
                    /*.transition(.offsetScaleOpacity)*/
                    /*.transition(.asymmetric(insertion: .scale(scale: 0, anchor: .top), removal: .offset(x:600, y: 0)))*/
                
                    //2. La primera ves que lo presionamos vemos que la animacion funcioa pero a la siguiente vemos que pareciera que dejo de funcionar y solo muestra una, para ello deberemos ir ajustando el X del offset
                    /*.transition(.asymmetric(insertion: .scale(scale: 0, anchor: .top), removal: .offset(x:400, y: 0)))*/
                    //3. Vemos que ahora si funciona un poco mejor pero si lo presionamos mas rapido vemos que tambien tiende a fallar
                
                    //4. Ahora invocamos a la nueva extencion
                    .transition(.seleInOffsetOut)
            }
        }
        .onTapGesture {
            withAnimation(.default){
                showDetails.toggle()
            }
        }
    }
}

extension AnyTransition {
    static var offsetScaleOpacity: AnyTransition {
        AnyTransition
            .offset(x: 600, y: 0)
            .combined(with: .scale(scale: 0, anchor: .top))
            .combined(with: .opacity)
    }
    //4. Tambien podemos crear la propia extencion
    static var seleInOffsetOut: AnyTransition {
        AnyTransition
            .asymmetric(insertion: .scale(scale: 0, anchor: .top), removal: .offset(x:400, y: 0))
    }
}

#Preview {
    ContentView()
}
