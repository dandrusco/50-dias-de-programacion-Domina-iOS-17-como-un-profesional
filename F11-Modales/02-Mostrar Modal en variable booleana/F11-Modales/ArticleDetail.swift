//
//  ArticleDetail.swift
//  F10-ProyectosArticulos
//
//  Created by Danilo Andrusco on 06-03-24.
//

import SwiftUI

struct ArticleDetail: View {
    
    //4. Declararemos la variable de entorno dismiss para volver atras
    @Environment(\.dismiss) var dismiss

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
        .navigationBarTitleDisplayMode(.inline)
        //1. Para que la imagen se vaya hacia arriba saltandose las areas seguras, podemos utilizar el parametro .ignoresSafeArea y en este caso la mandaremos hacia arriba
        .ignoresSafeArea(.all, edges: .top)
        //2. Si nos valos a la ContentView y entramos en cualquier articulo ahora vemos que el boton volver a tras se ve encima de la imagen y no queda muy bonito, para solucionarlo deberemos ocultar el boton
        .navigationBarBackButtonHidden(true)
        //3. Ahora deberemos crear el boton, utilizaremos toolbar para configurar items de la barra de navegacion
        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button {
                    //50 volvemos atras con dismiss
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left.circle.fill")
                }.tint(.white)
            }
        }
        
    }
}

#Preview {
    NavigationStack{
        ArticleDetail(article: articles[0])
            .navigationTitle("Articulo")
    }
}
