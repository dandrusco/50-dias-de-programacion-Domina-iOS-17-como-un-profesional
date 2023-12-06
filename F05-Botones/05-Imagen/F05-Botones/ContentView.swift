//
//  ContentView.swift
//  F05-Botones
//
//  Created by Danilo Andrusco on 05-12-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1. Crearemos un boton con imagen, en este caso con la papelera
        Button(action: {
            print("Hemos pulsado el boton")
        }, label: {
            Image(systemName: "trash")
                .font(.largeTitle)
                .foregroundStyle(.black)
                //2. Le pondremos um fondo redondeado
                .padding()
                .background(.red)
                .clipShape(Circle())
                //3. Le pondremos un texto
                Text("Elimninar")
                .fontWeight(.bold)
                .font(.title)
        })
        //4. Otra forma seria asi:
        Button(action: {
            print("Hemos pulsado el boton")
        }, label: {
            //5. Crearemos un HStack
            HStack{
                //6. Primero agregamos la imagen
                Image(systemName: "trash")
                    .font(.largeTitle)
                
                //6. AHora agregamos el texto
                Text("Elimninar")
                    .fontWeight(.bold)
                    .font(.title)
            }
            //7 Fuera de la HStack pintamos
            .foregroundStyle(.black)
            .padding()
            .background(.red)
            
            //8. Agregaremos el cornerRadius
            .cornerRadius(40)
        })
        
        //9. Podemos presindir del la HStack cambiandola por  una Label
        Button(action: {
            print("Hemos pulsado el boton")
        }, label: {
            //10. Cambiaremos la HStack por Label
            Label (
                //11. Primero configuraremos el titulo
                title: {
                    Text("Elimninar")
                        .fontWeight(.bold)
                        .font(.title)
                },
                //12. y en icon va la imagwn
                icon: {
                    Image(systemName: "trash")
                        .font(.largeTitle)
                }
            )
            .foregroundStyle(.black)
            .padding()
            .background(.red)
            .cornerRadius(40)
        })
    }
}

#Preview {
    ContentView()
}
