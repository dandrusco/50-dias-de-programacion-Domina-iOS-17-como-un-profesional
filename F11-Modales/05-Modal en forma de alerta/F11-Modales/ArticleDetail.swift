//
//  ArticleDetail.swift
//  F10-ProyectosArticulos
//
//  Created by Danilo Andrusco on 06-03-24.
//

import SwiftUI

struct ArticleDetail: View {
    
    @Environment(\.dismiss) var dismiss
    
    //2. Definiremos una variable de estado para la alerta
    @State private var showAlert = false

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
        .overlay(
            HStack{
                Spacer()
                VStack{
                    Button{
                        //3. Ahora al precionar el boton no llamaremos directamente al dismiss
                        /*dismiss()*/
                        
                        //4. Si no que cambiamos el ShowAlert a verdadero
                        showAlert = true
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.gray)
                    }
                    .padding(.trailing, 16)
                    .padding(.top, 16)
                    Spacer()
                }
            }
        )
        //5. Despues de la overlay configuraremos el alert, indicando el titulo, en isPresented es la variable bindeada que sera el showAlert con signo dolar
        .alert("Cuidado!", isPresented: $showAlert, actions: {
            //6. En la accion pondremos dos botones, uno para el SI, y el otro para cancelar la accion del boton
            Button{
                //7. Con la opcion afirmativa cerraremos la pantalla
                dismiss()
            } label: {
                Text("Si")
            }
            //8. Ahora configuraremos el segundo boton donde el rol sera de canelar, la accion no hara nada {} y la label sera el texto
            Button(role: .cancel, action: {}){
                Text("No")
            }
        }
        //9. Podemos configurar un parametro más para el mensaje
        , message: {
            Text("Estas seguro que quieres cerrar el articulo?")
        })
    }
}

#Preview {
    NavigationStack{
        ArticleDetail(article: articles[0])
            .navigationTitle("Articulo")
    }
}
