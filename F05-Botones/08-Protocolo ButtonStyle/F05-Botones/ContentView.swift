//
//  ContentView.swift
//  F05-Botones
//
//  Created by Danilo Andrusco on 05-12-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1. Meteremos este Button en una VStack
        VStack {
            //2. Copiaremos el Button y lo pegaremos  2 veces
            Button(action: {
                print("Hemos pulsado el boton")
            }, label: {
                Label (
                    title: {
                        //3. Este sera para editar
                        Text("Editar")
                            .fontWeight(.bold)
                            .font(.title)
                    },
                    icon: {
                        //4. le cambiamos el icono
                        Image(systemName: "square.and.pencil")
                            .font(.largeTitle)
                    }
                )
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundStyle(.black)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color("PrimerColor"), Color("SegundoColor")]), startPoint: .top, endPoint: .trailing))
                .cornerRadius(40)
                .shadow(color: .gray, radius: 10, x: 15, y: 10)
                .padding(.horizontal, 10)
                
            })
            Button(action: {
                print("Hemos pulsado el boton")
            }, label: {
                Label (
                    title: {
                        //5. Lo cambiamos a compartir
                        Text("Compartir")
                            .fontWeight(.bold)
                            .font(.title)
                    },
                    icon: {
                        //6. Le cambiamos el icono
                        Image(systemName: "square.and.arrow.up")
                            .font(.largeTitle)
                    }
                )
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundStyle(.black)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color("PrimerColor"), Color("SegundoColor")]), startPoint: .top, endPoint: .trailing))
                .cornerRadius(40)
                .shadow(color: .gray, radius: 10, x: 15, y: 10)
                .padding(.horizontal, 10)
        })
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
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundStyle(.black)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color("PrimerColor"), Color("SegundoColor")]), startPoint: .top, endPoint: .trailing))
                .cornerRadius(40)
                .shadow(color: .gray, radius: 10, x: 15, y: 10)
                .padding(.horizontal, 10)
        })
        }
    }
}

#Preview {
    ContentView()
}
