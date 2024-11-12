//
//  ArticleDetail.swift
//  F10-ProyectosArticulos
//
//  Created by Danilo Andrusco on 06-03-24.
//

import SwiftUI

struct ArticleDetail: View {
    
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
        //2. Como en los Modal no hau navigation bar podemos presindir de este codigo
        /*.navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(.all, edges: .top)
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left.circle.fill")
                }.tint(.white)
            }
        }*/
        //3. Para añadir el boton de cierre lo haremos mediante un Overlay
        .overlay(
            //4. Meteremos el boton dentro de una HStack
            HStack{
                //8. Y como es de esperar si metemos un spacer aqui, tirara el boton a la derecha
                Spacer()
                //5. Ahora meteremos el boton en una VStack
                VStack{
                    //6. Crearemos un boton de dismiss
                    Button{
                        dismiss()
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.gray)
                    }
                    //9. Para que el boton respire crearemos dos padding
                    .padding(.trailing, 16)
                    .padding(.top, 16)
                    //7. La idea principal de meter el boton en una VStack es que ahora con Spacer lo podemos dejar arriba del todo
                    Spacer()
                }
            }
        )
    }
}

#Preview {
    NavigationStack{
        ArticleDetail(article: articles[0])
            .navigationTitle("Articulo")
    }
}
