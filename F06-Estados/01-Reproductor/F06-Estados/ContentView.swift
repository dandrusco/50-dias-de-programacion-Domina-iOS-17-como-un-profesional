//
//  ContentView.swift
//  F06-Estados
//
//  Created by Danilo Andrusco on 11-12-23.
//

//1. Simularemso un reproductor de musica
import SwiftUI

struct ContentView: View {
    
    //2. Crearemos una variable de privada para ver si se esta reproduciondo musica, por defecto en false
    private var isPlaying = false

    var body: some View {
        VStack {
            //3. Crearemos un boton de play de color cyan que luego lo cambiaremos por el icono de stop de color rojo dependiendo si fue accionado isPlaying
            Button{
                //TODO: Cambiar el play a stop segun los estados de la app
            } label: {
                //4. Creaamos la imagen booleana con los dos iconos
                Image(systemName: isPlaying ? "stop.circle" : "play.circle")
                    .font(.system(size: 80))
                    //5. Para el color tambien lo necesitariamos boleano
                    .foregroundStyle(isPlaying ? .red : .cyan)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
