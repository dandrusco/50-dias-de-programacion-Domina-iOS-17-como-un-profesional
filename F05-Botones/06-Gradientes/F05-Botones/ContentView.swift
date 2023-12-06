//
//  ContentView.swift
//  F05-Botones
//
//  Created by Danilo Andrusco on 05-12-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            print("Hemos pulsado el boton")
        }, label: {
            Label (
                title: {
                    Text("Elimninar")
                        .fontWeight(.bold)
                        .font(.title)
                },
                icon: {
                    Image(systemName: "trash")
                        .font(.largeTitle)
                }
            )
            .foregroundStyle(.black)
            .padding()
            //1. Para crear gradientes de color cambiaremos el .red por LinearGradient indicandole 2 colores, donde comienza y por donde termina
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .trailing))
            .cornerRadius(40)
        })
        //2. Si quisieramos crear nuestros propios colores deberemos irno hasta Assets, boton derecho y seleccionar New Color Set, le pondremos el nombre que estimemos, seleccionaremos el Any Appearence y Dark (modo claro y modo oscuro) y en el inspector configuraremos el color, por ejemplo en 8-bit- hexadecimal #1565c0 y lo mismo para un segundo color por ejemplo #b92b27
        //3. Copiaremos el mismo boton
        Button(action: {
            print("Hemos pulsado el boton")
        }, label: {
            Label (
                title: {
                    Text("Elimninar")
                        .fontWeight(.bold)
                        .font(.title)
                },
                icon: {
                    Image(systemName: "trash")
                        .font(.largeTitle)
                }
            )
            .foregroundStyle(.black)
            .padding()
            //4. Cambiaremos por nuestros colores
            .background(LinearGradient(gradient: Gradient(colors: [Color("PrimerColor"), Color("SegundoColor")]), startPoint: .top, endPoint: .trailing))
            .cornerRadius(40)
            //5. podemos poner unas sombras e incluso desplazarla en ejes x e y
            .shadow(color: .gray, radius: 10, x: 15, y: 10)
        })
    }
}

#Preview {
    ContentView()
}
