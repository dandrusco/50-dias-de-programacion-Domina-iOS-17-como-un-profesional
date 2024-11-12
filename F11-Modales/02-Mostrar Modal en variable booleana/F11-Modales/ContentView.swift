//
//  ContentView.swift
//  F10-ProyectosArticulos
//
//  Created by Danilo Andrusco on 06-03-24.
//

//1. crearemos un nuevo fichero de SwiftUi llamado AticleDetail

import SwiftUI

struct ContentView: View {
    //3. Crearemos una variable de estado de tipo boleano que por defecto sera falso.
    @State var showDetail = false
    //4. Crearemos variable de estado para ver si se selecciona o no un articulo, deberemos ponerla como opcional ya que no sabemos hasta que se seleccione el primero
    @State var selectedArticle: Article?
    
    var body: some View {
        //1. Meteremos la lista en una Navigation Stack
        NavigationStack{
            List(articles) { article in
                
                ArticleRow(article: article)
                //11. Podemos utilizar el onTapGesture para poder reconocer el toque en pantalla
                    .onTapGesture {
                        //12. Si se toca un articulo, la variable showDetail pasara a ser true
                        showDetail = true
                        //13. AHora la variable selectedArticle debera guardar cual es el articulo seleccionado
                        selectedArticle = article
                        //14. La primera vez que le hacemos clic nos quedara el modal en blanco, esto es un bug que aun no ha sido solucionado por apple 
                    }
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            //5. Ahora llamaremos a .sheet para indicarle el contenido, al ser presionado el showDetail pasara a valer verdadero, deberemos anteponer el signo dolar ya que estamos referenciando a una variable de estado
            .sheet(isPresented: $showDetail){
                //6. realizaremos un casting seguro para la variable selectedArticle (Que la variable resulte No ser Nula), ya que les recuerdo que es en principio opcional (?)
                if let selectedArticle = selectedArticle{
                    //7. Arrastraeremos el archivo ArticleDetail donde estan nuestros archivos
                    //8. Ahora invacamos a ArticleDetail, indicandole que el articulo que le vamos a pasar es el seletedArticle
                    ArticleDetail(article: selectedArticle)
                    //9. La presentacion de la vista modal depende del valor de la variable booleana showDetail
                    //10. Ahora lo que nos falta es poder detectar el toque del usuario para lanzar el modal
                    
                }
            }
            //2. Le pondremos un titulo
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
