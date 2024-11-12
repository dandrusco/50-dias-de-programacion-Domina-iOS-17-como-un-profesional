//
//  ContentView.swift
//  F06-Estados
//
//  Created by Danilo Andrusco on 11-12-23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var counter = 0

    var body: some View {
        VStack {
            //2. Nos llevaremos este boton a la estructura
            /*Button{
                counter += 1
            } label: {
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.cyan)
                    .overlay(
                        Text("\(counter)")
                            .font(.system(size: 60, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                )
            }*/
            //8. Crearemos 2 HStack y en su interior llamaremos 2 veces a la estructura RoundedButton con diferentes colores
            HStack {
                //9. A la estructura le deberemos pasar el counter anteponiendo el signo dolar para indicar que es un vinculo
                RoundedButton(counter: $counter, color: .red)
                RoundedButton(counter: $counter, color: .yellow)
            }
            HStack {
                RoundedButton(counter: $counter, color: .green)
                RoundedButton(counter: $counter, color: .blue)
            }
        }
        .padding()
    }
}

//1 Crearemos un estructura para poder crear mas botones de diferentes colores
struct RoundedButton: View {
    
    //7. Para solucionarlo deberemnos crear nuevamente una variable counter pero de tipo entera (Int), pero en vez de ser un stado devera ser un vinculo, un vinculo en SwinftUI se llama Binding
    @Binding var counter: Int //Tecticamente hemos creado una referencia a la variable de stado llamada counter
    
    //4. Crearemos la varieble color de tipo color
    var color: Color
    
    var body: some View {
        //3. lo pegaremos aqui
        Button{
            //6. Como pueden ver counter nos esta dando un error. ya que counter es una un variable de estado pero privada, solo puede acceder desde la propia ContentView
            counter += 1
        } label: {
            Circle()
                .frame(width: 150, height: 150)
                //5. Reemplazaremos el .cyan por el color
                .foregroundStyle(color)
                .overlay(
                    Text("\(counter)")
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
            )
        }
    }
}


#Preview {
    ContentView()
}
