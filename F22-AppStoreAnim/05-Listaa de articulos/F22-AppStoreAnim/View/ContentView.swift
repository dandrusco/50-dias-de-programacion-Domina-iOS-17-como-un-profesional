//
//  ContentView.swift
//  F22-AppStoreAnim
//
//  Created by Danilo Andrusco on 05-12-24.
//

import SwiftUI

struct ContentView: View {
    
    //11. Para configurar si la imagen esta a full necesitamos crear una variable de estado
    @State private var showFullContent = false
    
    //12. Creamos una variable de estado para ver si se ha seleccionado algun articulo
    @State private var selectedArticle: Article?
    
    //21. Hay un modificador llamado matchedGeometryEffect puede calcular la diferencia entre dos vistas, creando una animacion entre la vista inicial y la final. Para ello debemos crear una variable en forma de Namespace que nos permita trabajar con este modificador
    @Namespace var nsArticle
    
    var body: some View {
        //5. Comenzaremos a programar nuestra vista, para ello crearemos una ZStack
        ZStack(alignment: .top){
            //6. Creamos una Scrollview
            ScrollView {
                //7. La Scrollview tengra una VStack con un espaciado de 42 puntos
                VStack(spacing: 42) {
                    TopView()
                        //8. Le metemos un padding de 24 puntos
                        .padding(.horizontal, 24)
                    //9. Vamos a recorrer los articulos
                    ForEach(articles) { article in
                        
                        //10. Creamos una variable para la creacion de la imagen y la forzamos ya que nunca sera nulo
                        let img = UIImage(named: article.image)!
                        
                        //13. Recuperamos los datos de ne la CardView
                        CardView(category: article.category, title: article.title, subtitle: article.excerpt, image: img, content: article.content, isFullContent: self.$showFullContent)
                            //14. Configuramos la imagen
                            .padding(.horizontal, 16)
                            .frame(height: min(500, img.size.height))
                            //15. Cuando un usuario toque un articulo, debemos poner la pantalla completa
                            .onTapGesture {
                                //16. Creamos la animacion
                                withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.7, blendDuration: 0.15)){
                                    //17.selectedArticle seria igual al articulo seleccionado
                                    self.selectedArticle = article
                                    //18. Pasamos de false a true
                                    self.showFullContent.toggle()
                                }
                            }
                        //22. Alñadimos el matchedGeometryEffect en el IDE le pasamos el indice del articulo, y se guardara la animacion en la nsArticle
                            .matchedGeometryEffect(id: article.id, in: nsArticle)
                    }
                    
                    
                }
                //19. metemos un paffing para que respire mejor
                .padding()
            }
            //20 meteremos una opacidad para que cuando estemos a pantalla completa, no se muestre la pantalla por debajo
            .opacity(self.showFullContent ? 0 : 1)
            
            //23. Afuera de la Scrollview, debemos decidir si devemos ver el art6iculo a pantalla completa
            if self.showFullContent, let selectedArticle {
                //24. le pasamos todo lo seleccionado del articulo
                CardView(category: selectedArticle.category, title: selectedArticle.title, subtitle: selectedArticle.excerpt, image: UIImage(named: selectedArticle.image)!, content: selectedArticle.content, isFullContent: self.$showFullContent)
                    //25. Le pasamos el matchedGeometryEffect pasandole como ide el articulo seleccionado
                    .matchedGeometryEffect(id: selectedArticle.id, in: nsArticle)
                    //26.  vamos a ingorar el safe area.
                    .ignoresSafeArea()
            }
            
        }
    }
}

#Preview {
    ContentView()
}


struct TopView: View {
    var body: some View {
        HStack(alignment: .lastTextBaseline, content: {
            VStack(alignment: .leading, content: {
                Text(getCurrentDate().uppercased())
                    .font(.caption)
                    .foregroundStyle(Color.secondary)
                Text("Hoy")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            })
            Spacer()
            //4. Le pasamos la imagen
            UserView(image: "Mila", size: CGSize(width: 50, height: 50))
        })
    }
    
    func getCurrentDate(with format: String = "EEEE, d MMM YYYY") -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: Date())
    }
}

struct UserView: View {
    
    //1. Vamos a necesitar una imagen y un tamaño
    let image: String
    let size: CGSize
    
    
    var body: some View {
        //2. Metemos la imagen, para ello nos vamos a los Assets, buscamos una foto nuestra y la arrastramos.
        //3. Configuramos la imagen
        Image(self.image)
            .resizable()
            .scaledToFill()
            .frame(width: self.size.width, height: self.size.height)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.teal, lineWidth: 2))
    }
}
