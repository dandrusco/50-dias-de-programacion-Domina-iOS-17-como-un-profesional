//
//  ContentView.swift
//  F10-ProyectosArticulos
//
//  Created by Danilo Andrusco on 06-03-24.
//

//1. crearemos un nuevo fichero de SwiftUi llamado AticleDetail

import SwiftUI

struct ContentView: View {
    
    //5. Este estado ya no nos sive
    /*@State var showDetail = false*/
    @State var selectedArticle: Article?
    
    var body: some View {
        NavigationStack{
            List(articles) { article in
                ArticleRow(article: article)
                    .onTapGesture {
                        //6. Lo eliminamos de aca tambien
                        /*showDetail = true*/
                        selectedArticle = article
                    }
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            //1. El constructor .sheet vamos a camibar para que en vez de la variable booleana (isPresented) sea con variale opcional (items) y le pasaremos el $selectedArticle, pero deberemos capturar el article
            .sheet(item: $selectedArticle){ article in
                //2. Ya no hace falta el casting seguro
                /*if let selectedArticle = selectedArticle{*/
                //3. Le pasamos el articulo capturado
                ArticleDetail(article: article)
                //4. Esto quiere decir que el modal se presentara si la variable opcional selectedArticle tiene un valor
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
