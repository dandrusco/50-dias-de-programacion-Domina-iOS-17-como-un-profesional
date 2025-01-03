//
//  ContentView.swift
//  F31-Tabs
//
//  Created by Danilo Andrusco on 03-01-25.
//

import SwiftUI

struct ContentView: View {
    
    
    //1. Cada vez que tocamos un icono este cambia y nuestra diferentes informaciones, pero tambien lo podemos programar nosostros mismos, para ello requiere de una variable de estado que llamaremos selection, y su valor sera 0
    @State private var selection = 0
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            VStack {
                //2. A la TabView le pasaremos la seletion que creamos recien
                TabView(selection: $selection){
                    Text("Inicio")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "house")
                            Text("Inicio")
                        }
                        //3. Ahora deberemos crear el modificador Tag con un valor distinto, en este caso partiremos con el 0
                        .tag(0)
                    
                    Text("Favoritos")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "bookmark")
                            Text("Favoritos")
                        }
                        //4. Esta sera el 1
                        .tag(1)
                    
                    Text("Aprender")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "play.display")
                            Text("Aprender")
                        }
                        //5. Aqui el 1
                        .tag(2)
                    
                    Text("Mi cuenta")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "person")
                            Text("Perfil")
                        }
                        //6. Para finalizar el 3
                        .tag(3)
                }
                .tint(Color("TabColor"))
                
                //7. Creamos los botones de anterior y siguiente...., para ello los meteremos dentro de una HStack
                HStack{
                    //8. Creamos el boton que cambiara la seleccion actual incrementandola a 3 pero que no pase del 3 (%)
                    Button{
                        selection = (selection + 3) % 4
                    } label: {
                        //9. Configuramos el texto del boton
                        Text("Anterior")
                            .font(.system(.headline, design: .rounded))
                            .padding()
                            .foregroundStyle(.white)
                            .background(.teal)
                            .cornerRadius(10)
                            .padding()
                    }
                    //10. Con un Spacer tiramos ambos botones a los extremos
                    Spacer()
                    //11. Creamos el boton siguiente
                    Button{
                        //12. Creamos el boton que cambiara la seleccion actual incrementandola en 1 pero que no pase del 3 (%)
                        selection = (selection + 1) % 4
                    } label: {
                        //13. Configuramos el texto
                        Text("Siguiente")
                            .font(.system(.headline, design: .rounded))
                            .padding()
                            .foregroundStyle(.white)
                            .background(.teal)
                            .cornerRadius(10)
                            .padding()
                    }
                    
                }
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
