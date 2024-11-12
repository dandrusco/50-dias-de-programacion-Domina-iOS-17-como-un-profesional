//
//  ContentView.swift
//  F05-Botones
//
//  Created by Danilo Andrusco on 05-12-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                print("Hemos pulsado el boton")
            }, label: {
                Label (
                    title: {
                        Text("Editar")
                            .fontWeight(.bold)
                            .font(.title)
                    },
                    icon: {
                        Image(systemName: "square.and.pencil")
                            .font(.largeTitle)
                    }
                )
            })
            .buttonStyle(GradientButtonStyle())
            
            Button(action: {
                print("Hemos pulsado el boton")
            }, label: {
                Label (
                    title: {
                        Text("Compartir")
                            .fontWeight(.bold)
                            .font(.title)
                    },
                    icon: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.largeTitle)
                    }
                )
            })
            .buttonStyle(GradientButtonStyle())
            
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
            })
            .buttonStyle(GradientButtonStyle())
        }
    }
}

struct GradientButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundStyle(.black)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color("PrimerColor"), Color("SegundoColor")]), startPoint: .top, endPoint: .trailing))
            .cornerRadius(40)
            .shadow(color: .gray, radius: 10, x: 15, y: 10)
            .padding(.horizontal, 10)
            //1. Vamos a crear un efecto al pulsar el boton ,realizaremos un escalado que al precionar baje un 10% su tamaño y si no esta pulsado que se mantenga en el 100
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

#Preview {
    ContentView()
}
