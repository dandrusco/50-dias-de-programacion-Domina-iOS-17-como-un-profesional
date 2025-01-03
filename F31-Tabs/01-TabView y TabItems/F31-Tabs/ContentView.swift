//
//  ContentView.swift
//  F31-Tabs
//
//  Created by Danilo Andrusco on 03-01-25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        //1. Creamos una ZStack alineada topTrailing
        ZStack(alignment: .topTrailing){
            //2. Creamos una VStack
            VStack {
                //3. Creamos una TapView para un texto
                TabView(){
                    //4. Creamos un texto que diga inicio
                    Text("Inicio")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        //5. LLamamos al modificador tabItem
                        .tabItem {
                            //6. en su interior tendra una imagen de una casa con un texto que diga inicio
                            Image(systemName: "house")
                            Text("Inicio")
                        }
                    
                    //07. Creamos otro para favoritos
                    Text("Favoritos")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "bookmark")
                            Text("Favoritos")
                        }
                    
                    //8. Otro que sea para aprender
                    Text("Aprender")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "play.display")
                            Text("Aprender")
                        }
                    
                    //9. Otro para mi cuenta
                    Text("Mi cuenta")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "person")
                            Text("Perfil")
                        }
                }
                //10. Por defecto el color es azul pero podemos poner el color que queramos o incluso personalizarlo, tomaremos esta segunda opcion. Nos vamos a los Assets y le damos en ColorSet y lo crearemos de color medio teal (#449CB9). Ahora lo llamamos con el modificador .tint
                .tint(Color("TabColor"))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
