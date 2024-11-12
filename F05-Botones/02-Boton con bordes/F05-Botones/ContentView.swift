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
                //2. Eliminaremos tanto el padding como el background
                /*.padding()
                .background(Color.green)*/
                //3. Le cambiaremos el color a las letras a un negro
                .foregroundStyle(.black)
                .font(.title)
                //4. Le agregamos un padding
                .padding()
                //5. Como vemos no hace nada, ya que el padding lo creamos en esta ocacion para darle un borde mas ancho y no tan pegado al texto. Le pondremos una anchura de 4
                .border(Color.green, width: 4)
        }
        
        //1. Eliminaremos el boton antiguo
        /*Button(action: {
            print("Pulsé el boton antiguo")
        }, label: {
            Text("Boton antiguo")
        })*/
    }
}

#Preview {
    ContentView()
}
