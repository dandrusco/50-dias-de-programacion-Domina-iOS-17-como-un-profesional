//
//  ContentView.swift
//  F04-ScrollViews
//
//  Created by Danilo Andrusco on 04-12-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //3. Lo logico es que no tengamos una HStack para el titulo y luego una ScrollViewm, lo mas acorde es que primero ambas esten dentro de una VStack, asi queda mas ordenado de leer
        VStack {
            //2. Lo pegamos aqui
            HStack{
                VStack (alignment: .leading){
                    Text("05 de diciembre de 2023")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    Text("Tus cursos")
                        .font(.system(.largeTitle, design: .rounded))
                        .foregroundStyle(.primary)
                        .fontWeight(.bold)
                }
                Spacer()
            }
            .padding([.top, .horizontal])
            
            //6. Al movernos por el ScrollView vemos que aparece una barra, para eliminarla se lo pasamos comos egundo parametro showsIndicators: false
            ScrollView (.horizontal, showsIndicators: false){
                HStack {
                    //1. Nos llevaremos desde este HStack y lo pegaremos sobre la ScroollView para que el titulo quede arriba y no dentro del carrusel
                    /*HStack{
                     VStack (alignment: .leading){
                     Text("05 de diciembre de 2023")
                     .font(.caption)
                     .foregroundStyle(.secondary)
                     
                     Text("Tus cursos")
                     .font(.system(.largeTitle, design: .rounded))
                     .foregroundStyle(.primary)
                     .fontWeight(.bold)
                     }
                     Spacer()
                     }
                     .padding([.top, .horizontal])*/
                    
                    //4. Cambiaremos el tamaño de las tarjetas para ello las vamos a agrupar
                    Group {
                        CardView(image: "swift5", title: "Curso de Swift 5", description: "Aprende el lenguaje de programacion de Apple desde cero", level: "Nivel facil")
                        
                        CardView(image: "ios10", title: "Curso de iOS 10", description: "Crea tus primeras apps con iOS 10 y Swift", level: "Nivel medio")
                        
                        CardView(image: "ios11", title: "Curso de iOS 11", description: "Crea tus primeras apps con iOS 11 y Swift", level: "Nivel medio")
                        
                        CardView(image: "ios12", title: "Curso de iOS 12", description: "Crea tus primeras apps con iOS 12 y Swift", level: "Nivel medio")
                        
                        CardView(image: "ios13", title: "Curso de SwiftUI e iOS 13", description: "Crea tus primeras apps con iOS 13 y Swift UI", level: "Nivel facil")
                    }
                    //5. Y ahora le aplicamos un frame al grupo
                    .frame(width: 320)
                    //6. Como podemos ver el titulo se nos acorta, para ello nos vamos a la CardView
                }
            }
            //8. Le añadiremos un Spacer() para tirar todo hacia arriba
            Spacer()
        }
    }
}

struct ContentViewVertical: View {
    var body: some View {
        ScrollView{
            HStack{
                VStack (alignment: .leading){
                    Text("05 de diciembre de 2023")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text("Tus cursos")
                        .font(.system(.largeTitle, design: .rounded))
                        .foregroundStyle(.primary)
                        .fontWeight(.bold)
                }
                Spacer()
            }
            .padding([.top, .horizontal])
            
            VStack {
                CardView(image: "swift5", title: "Curso de Swift 5", description: "Aprende el lenguaje de programacion de Apple desde cero", level: "Nivel facil")
                
                CardView(image: "ios10", title: "Curso de iOS 10", description: "Crea tus primeras apps con iOS 10 y Swift", level: "Nivel medio")
                
                CardView(image: "ios11", title: "Curso de iOS 11", description: "Crea tus primeras apps con iOS 11 y Swift", level: "Nivel medio")
                
                CardView(image: "ios12", title: "Curso de iOS 12", description: "Crea tus primeras apps con iOS 12 y Swift", level: "Nivel medio")
                
                CardView(image: "ios13", title: "Curso de SwiftUI e iOS 13", description: "Crea tus primeras apps con iOS 13 y Swift UI", level: "Nivel facil")
                
            }
        }
    }
}


#Preview {
    ContentView()
}
