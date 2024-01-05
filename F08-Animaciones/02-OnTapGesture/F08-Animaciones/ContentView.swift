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
                //1. Ahora le pasaremos el circleChanged para ver que color poner dependiendo si es verdadero o falso
                .foregroundStyle(circleChanged ? Color(.systemGray4) : .teal)
            
            Image(systemName: "heart.fill")
                .font(.system(size: 80))
                //2. Realizaremos lo mismo en el color del corazon pero con el estado de heartColorChanged
                .foregroundStyle(heartColorChanged ? .teal : Color(.systemGray4))
                //3. Programaremos que si el corazon cambia de color que este cresca
                .scaleEffect(heartSizeChanged ? 1.5 : 0.75)
        }
        //4. Ahora tendremos que programar para que esto sea cliqueable a traves del onTapGesture
        .onTapGesture {
            //5. Cada vez que se presione cambiaran de false a true y biceversa a traves de un toggle
            circleChanged.toggle()
            heartColorChanged.toggle()
            heartSizeChanged.toggle()
        }
    }
}

#Preview {
    ContentView()
}
