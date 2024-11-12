//
//  ContentView.swift
//  F08-Animaciones
//
//  Created by Danilo Andrusco on 05-01-24.
//

import SwiftUI

struct ContentView: View {
    
    //1. Vamos a transformar una vista, para ello crearemos 2 estamos
    @State private var beginRecording = false
    @State private var isRecording = false
        
    var body: some View {
        //1. Utilizaremos una ZStack para apilar un RoundedRexctangle
        ZStack {
            //2. Creamos el RoundedRectangle donde el beginRecording dependera si comenzamos a grabar o no
            RoundedRectangle(cornerRadius: beginRecording ? 50 : 10)
                .frame(width: beginRecording ? 100 : 300, height: 100)
                .foregroundStyle(beginRecording ? .red : .teal)
                //3. Crearemos un Overlay para insertar una imagen
                .overlay(
                    Image(systemName: "mic")
                        .font(.system(.largeTitle))
                        .foregroundStyle(.white)
                    //4. Crearemos un efecto que miestraws estemos grabando el icono ira de arriba abajo
                        .scaleEffect(isRecording ? 0.75 : 1.0)
                )
            //5. Crearemos otro RoundedRectangle pero un poco mas grande para genere una especie de borde
            RoundedRectangle(cornerRadius: beginRecording ? 60 : 10)
                .trim(from: 0.0, to: beginRecording ? 0.00001 : 1)
                .stroke(lineWidth: 6)
                .frame(width: beginRecording ? 120 : 320, height: 120)
                .foregroundStyle(.teal)
        }
        //6. Para que funcione todo esto otilizaremos el onTapGesture para que se  inicie la animacion deberemos precionar el boton
        .onTapGesture {
            //7. Crearemos la animacion
            withAnimation(.default){
                beginRecording.toggle()
            }
            //8. Creamos otra animacion que se repita por siempre con un delay de un 0.5 segundo que afectara al icono del microfono
            withAnimation(.linear(duration: 1).repeatForever().delay(0.5)){
                isRecording.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
