//
//  ContentView.swift
//  F08-Animaciones
//
//  Created by Danilo Andrusco on 05-01-24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var circleChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 250, height: 250)
                .foregroundStyle(circleChanged ? Color(.systemGray6) : .teal)
            
            Image(systemName: "heart.fill")
                .font(.system(size: 80))
                .foregroundStyle(heartColorChanged ? .teal : Color(.systemGray6))
                .scaleEffect(heartSizeChanged ? 1.5 : 0.75)
               
        }
        //1. Vamos a eliminar estas animaciones implicitas para crear las explicitas
        /*.animation(.default, value: circleChanged)
        .animation(.default, value: heartSizeChanged)*/
        
        .onTapGesture {
            //2. Aqui es donde se programa las animaciones explicitas, para ello crearemos un bloque de animacion llamado withAnimation y le pasaremos la animacion que nosotros queramos, en este caso sera por defecto
            withAnimation(.default) {
                circleChanged.toggle()
                //3. Si recordamos el heartColorChanged no tenia animacion, asi que lo sacaremos
                /*heartColorChanged.toggle()*/
                heartSizeChanged.toggle()
            }
            //4. Lo pegamos fuera del withAnimation
            heartColorChanged.toggle()
        }
    }
}

#Preview {
    ContentView()
}
