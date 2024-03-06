//
//  ArticleDetail.swift
//  F10-ProyectosArticulos
//
//  Created by Danilo Andrusco on 06-03-24.
//

import SwiftUI

struct ArticleDetail: View {
    //2. Crearemos una variable para la vista del articulo
    var article: Article
    
    var body: some View {
       //4. COmo las vistas tendran mucha informacion deberemos meterla dentro de una ScrollView para que podamos bajar o subir
        ScrollView{
            //5. Meteremos una bajo la otra, por lo tanto necesitamos una VStack
            VStack(alignment: .leading){
                //6. Primero mostraremos la imagen
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            //7. Acontinuacion crearemos un grupo para meter informacion
            Group{
                //8. Primero va el titulo
                Text(article.title)
                    .font(.system(.title, design: .rounded))
                    .bold()
                    //17. Centraremos el titulo
                    .multilineTextAlignment(.center)
                    .lineLimit(4)
                
                //9. AHora va el autor
                Text("Redactador por \(article.author)".uppercased())
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                //10. Ahora la URL
                Text(article.url.lowercased())
                    .font(.callout)
                    .fontWeight(.thin)
                    .foregroundStyle(.secondary)
            }
            //11. Le realizaremos un padding al grupo
            .padding(.bottom, 2)
            .padding(.horizontal, 16)
            
            //12. Crearemos un segundo grupo
            Group{
                //13. Llamaremos al excerpt
                Text("\(article.excerpt)")
                    .bold()
                
                //14. Ahora al contenido
                Text(article.content)
            }
            //15. Le aplicaremos unos cambios al segundo grupo
            .font(.body)
            .padding(16)
            .lineLimit(100)
            //16. Tiraremos todo el texto a la izquierda
            .multilineTextAlignment(.leading)
        }
    }
}

#Preview {
    //18. La previu la meteremos en una navigationStack
    NavigationStack{
        //3. Le psaremos la lista de articulo en la posicion 0
        ArticleDetail(article: articles[0])
        //19. Le pondremos un titulo
            .navigationTitle("Articulo")
    }
}
