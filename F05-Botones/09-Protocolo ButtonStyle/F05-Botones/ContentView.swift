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
            //1. Como pueden apreciar salvo el texto y el icono, todo el estilo (modificadores) del boton se mantine para los 3 botones
            //2. Si quieramos cambiar por ejemplo la anchura del boton, deberias ir uno a uno cambiandole los parametros, para ello podemos generalizar el estilo del boton para poder reutilizar, para ello tenemos el ButtonStyle
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
                //6. Nos llevaremos todo esto
                /*.frame(minWidth: 0, maxWidth: .infinity)
                .foregroundStyle(.black)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color("PrimerColor"), Color("SegundoColor")]), startPoint: .top, endPoint: .trailing))
                .cornerRadius(40)
                .shadow(color: .gray, radius: 10, x: 15, y: 10)
                .padding(.horizontal, 10)*/
            })
            //8. ahora llamamos a nuestra estructura con el modificador ButtonStyle, para aplicarcelo al boton
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
                //9. Eliminamos esto...
                /*.frame(minWidth: 0, maxWidth: .infinity)
                .foregroundStyle(.black)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color("PrimerColor"), Color("SegundoColor")]), startPoint: .top, endPoint: .trailing))
                .cornerRadius(40)
                .shadow(color: .gray, radius: 10, x: 15, y: 10)
                .padding(.horizontal, 10)*/
            })
            //10. Pegamos el estilo
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
                //11. Lo mismo aquí, eliminamos esto...
                /*.frame(minWidth: 0, maxWidth: .infinity)
                .foregroundStyle(.black)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color("PrimerColor"), Color("SegundoColor")]), startPoint: .top, endPoint: .trailing))
                .cornerRadius(40)
                .shadow(color: .gray, radius: 10, x: 15, y: 10)
                .padding(.horizontal, 10)*/
            })
            //12. Pegamos el estilo
            .buttonStyle(GradientButtonStyle())
        }
    }
}

//3. Crearemos una estructura para el protocolo ButtonStyle
struct GradientButtonStyle: ButtonStyle{
    //4. por obligacion deberemos llamar a la funcion makeBody que tiene un parametro de configuracion
    func makeBody(configuration: Configuration) -> some View {
        //5. Accederemos a la etiqueta de la vista y le aplicaremos toda la configuracion para la label
        configuration.label
        //7. Lo pegamos aquí:
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundStyle(.black)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color("PrimerColor"), Color("SegundoColor")]), startPoint: .top, endPoint: .trailing))
            .cornerRadius(40)
            .shadow(color: .gray, radius: 10, x: 15, y: 10)
            .padding(.horizontal, 10)
    }
}

#Preview {
    ContentView()
}
