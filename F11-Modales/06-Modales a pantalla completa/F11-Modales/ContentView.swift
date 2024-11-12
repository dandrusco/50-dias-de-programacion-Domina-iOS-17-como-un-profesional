//
//  ContentView.swift
//  F10-ProyectosArticulos
//
//  Created by Danilo Andrusco on 06-03-24.
//


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
            //1. En iOS14 se nos da la posibilidad de de crear un modal a pantalla completa, para ello deberemos cambiar de .sheet
            .fullScreenCover(item: $selectedArticle){ article in
                ArticleDetail(article: article)
            }
            //2. para que llegue arriba del todo deberemos modificar el ArticleDetail
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
