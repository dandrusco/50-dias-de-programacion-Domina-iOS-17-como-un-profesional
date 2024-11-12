//
//  ContentView.swift
//  F10-ProyectosArticulos
//
//  Created by Danilo Andrusco on 06-03-24.
//

//1. Cuando el usuario precione la X lanzaremos una alerta para ver si realmente quiere cerrar la ventana modal 

import SwiftUI

struct ContentView: View {
    
    @State var selectedArticle: Article?
    
    var body: some View {
        NavigationStack{
            List(articles) { article in
                ArticleRow(article: article)
                    .onTapGesture {
                        selectedArticle = article
                    }
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .sheet(item: $selectedArticle){ article in
                ArticleDetail(article: article)
            }
            .navigationTitle("El Blog de Frogames")
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
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .lineLimit(3)
                .padding(.bottom, 0)
            
            Text("Creado por \(article.author)".uppercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 0)
            
            Text("\(article.url)".lowercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 0)
            
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
            
        }
    }
}
