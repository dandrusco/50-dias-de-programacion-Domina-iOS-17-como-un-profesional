//
//  ContentView.swift
//  F04-ScrollViews
//
//  Created by Danilo Andrusco on 04-12-23.
//

import SwiftUI

//6. Vamos a copiar toda la ContentView y la pegaremos mas abajo
struct ContentView: View {
    var body: some View {
        //5. Para cambiar el ScollView de manera horizontal se lo debemos pasar por parametro
        ScrollView (.horizontal){
            HStack{
                //1. Agregaremos una VStack para poner la fecha encima del titulo
                VStack (alignment: .leading){
                    Text("05 de diciembre de 2023")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    //2. Pondremos como cursos
                    Text("Tus cursos")
                        .font(.system(.largeTitle, design: .rounded))
                        .foregroundStyle(.primary)
                        .fontWeight(.bold)
                }
                //3. Alinearemos a la izquierda
                Spacer()
            }
            //4. Dos padding
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

//7. La pegamos aqui pero la llamaremos ContentViewVertical para no perderla
struct ContentViewVertical: View {
    var body: some View {
        //8. Esta la dejaremos sin el parametro
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
