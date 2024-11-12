//
//  ArticleDetail.swift
//  F10-ProyectosArticulos
//
//  Created by Danilo Andrusco on 06-03-24.
//

import SwiftUI

struct ArticleDetail: View {

    var article: Article
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        
            Group{
                Text(article.title)
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .multilineTextAlignment(.center)
                    .lineLimit(4)
                
                Text("Redactador por \(article.author)".uppercased())
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(article.url.lowercased())
                    .font(.callout)
                    .fontWeight(.thin)
                    .foregroundStyle(.secondary)
            }
            .padding(.bottom, 2)
            .padding(.horizontal, 16)
            
            Group{
                Text("\(article.excerpt)")
                    .bold()
                Text(article.content)
            }
            .font(.body)
            .padding(16)
            .lineLimit(100)
            .multilineTextAlignment(.leading)
        }
    }
}

#Preview {
    NavigationStack{
        ArticleDetail(article: articles[0])
            .navigationTitle("Articulo")
    }
}
