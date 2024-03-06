//
//  ContentView.swift
//  F10-ProyectosArticulos
//
//  Created by Danilo Andrusco on 06-03-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //4. Para que la lista sea navegable, tendremos que meterla en una NavigationStack
        NavigationStack {
            List(articles) { article in
                //5. Cada uno de los articulos los meteremos dentro de una NavigationLink, donde el destino sera los articulos preparados anteior mente en el ArticleDetail
                NavigationLink(destination: ArticleDetail(article: article)){
                    //6. Ahora metemos el ArticleRow para mostrar cada uno de los ariculos por pantalla
                    ArticleRow(article: article)
                }
                //7. El listRowSeparator debe quedar por debajo del NavigationLink
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            //8. Le pondremos un Titulo
            .navigationTitle("El blog de Frogames")
        }
    }
}

#Preview {
    ContentView()
}

struct ArticleRow: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Image(article.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
            
            Text(article.title)
                //1. Cambiaremos el .title por el .titler3 para achicar el titulo
                .font(.system(.title3, design: .rounded))
                .fontWeight(.black)
                .lineLimit(3)
                .padding(.bottom, 0)
            
            Text("Creado por \(article.author)".uppercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 0)
            
            //2. Eliminaremso la URL ya que no la concideramos importante
            /*Text("\(article.url)".lowercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 0)*/
            
            HStack(spacing: 3) {
                ForEach(1...(article.rating), id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                }
            }
            
            Text(article.excerpt)
                .font(.subheadline)
                .foregroundColor(.secondary)
                //3. Lo cortaremos a 5 lineas
                .lineLimit(5)
            
        }
    }
}
