//
//  ContentView.swift
//  F04-ScrollViews
//
//  Created by Danilo Andrusco on 04-12-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView (.horizontal){
            //1. Crearemos otra HStack
            HStack {
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
                
                //2. Copiaremos y pegaremos aquí las 5 CardView
                CardView(image: "swift5", title: "Curso de Swift 5", description: "Aprende el lenguaje de programacion de Apple desde cero", level: "Nivel facil")
                
                CardView(image: "ios10", title: "Curso de iOS 10", description: "Crea tus primeras apps con iOS 10 y Swift", level: "Nivel medio")
                
                CardView(image: "ios11", title: "Curso de iOS 11", description: "Crea tus primeras apps con iOS 11 y Swift", level: "Nivel medio")
                
                CardView(image: "ios12", title: "Curso de iOS 12", description: "Crea tus primeras apps con iOS 12 y Swift", level: "Nivel medio")
                
                CardView(image: "ios13", title: "Curso de SwiftUI e iOS 13", description: "Crea tus primeras apps con iOS 13 y Swift UI", level: "Nivel facil")
            }
            //3. Eliminaremos este VStack junto a las CardView
            /*VStack {
                CardView(image: "swift5", title: "Curso de Swift 5", description: "Aprende el lenguaje de programacion de Apple desde cero", level: "Nivel facil")
                
                CardView(image: "ios10", title: "Curso de iOS 10", description: "Crea tus primeras apps con iOS 10 y Swift", level: "Nivel medio")
                
                CardView(image: "ios11", title: "Curso de iOS 11", description: "Crea tus primeras apps con iOS 11 y Swift", level: "Nivel medio")
                
                CardView(image: "ios12", title: "Curso de iOS 12", description: "Crea tus primeras apps con iOS 12 y Swift", level: "Nivel medio")
                
                CardView(image: "ios13", title: "Curso de SwiftUI e iOS 13", description: "Crea tus primeras apps con iOS 13 y Swift UI", level: "Nivel facil")
                
            }*/
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
