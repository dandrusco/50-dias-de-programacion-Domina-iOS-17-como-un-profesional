//
//  ContentView.swift
//  F10-ProyectosArticulos
//
//  Created by Danilo Andrusco on 06-03-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(articles) { article in
                ZStack {
                    ArticleRow(article: article)
                    
                    NavigationLink(destination: ArticleDetail(article: article)){
                        EmptyView()
                    }
                    .opacity(0)
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
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
                .font(.system(.title3, design: .rounded))
                .fontWeight(.black)
                .lineLimit(3)
                .padding(.bottom, 0)
            
            Text("Creado por \(article.author)".uppercased())
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
                .lineLimit(5)
            
        }
    }
}
