//
//  CardView.swift
//  F22-AppStoreAnim
//
//  Created by Danilo Andrusco on 06-12-24.
//

import SwiftUI

struct CardView: View {
    //2. Nos cargamos todo y comenzamos a programar las categorias, titulo, subtitulo, imagen y contenido
    let category: String
    let title: String
    let subtitle: String
    let image: UIImage
    var content: String = ""
    
    //3. utilizamos el mismo bindign para ver si esta a pantalla completa
    @Binding var isFullContent: Bool
    
    
    var body: some View {
        //5. Si Vamos probando cada unas de las imagenes o titulos vemos que se nos escapan ya que unas son mas grandes que otras, para ello SwiftUI nos da pa opcion de agregar un GeometryReader que nos devuelve la geometria (geometry)
        GeometryReader { geometry in
            //6. Meteremos una Zstack para el boton de cierre alineada arriba, a la derecha
            ZStack(alignment: .topTrailing) {
                //7. La vista debe ser scroleable
                ScrollView{
                    //8. Metemos una VStack alineada a la izquierda
                    VStack(alignment: .leading, content: {
                        //9. Pondremos la imagen
                        Image(uiImage: self.image)
                            .resizable()
                            .scaledToFill()
                        //10. Configuramos el tamaño de la imagen estando en full y no estando en full
                            .frame(width: geometry.size.width, height: self.isFullContent ? geometry.size.height*0.6: min(500,  self.image.size.height))
                        //11. Lo mismo para el border de color RGB
                            .border(Color(.sRGB, red: 120/255, green: 210/255, blue: 215/255, opacity: 0.2), width: self.isFullContent ? 0 : 3)
                            .cornerRadius(16)
                        //12. Creamos una capa por encima para el rellenado de datos
                            .overlay(
                                TitleView(category: self.category,
                                          title: self.title,
                                          subtitle: self.subtitle,
                                          isFullContent: self.$isFullContent)
                                //13. COnfiguramos el cornerRadio si esta o no en Full
                                .cornerRadius(self.isFullContent ? 0 : 16)
                            )
                        
                        //14. Si esta en pantalla completa...
                        if self.isFullContent{
                            //15. Añadiremos el contenido completo...
                            Text(self.content)
                                .foregroundStyle(Color(.darkGray))
                                .font(.system(.body, design: .rounded))
                                .padding(.horizontal)
                                .padding(.bottom, 48)
                                .transition(.move(edge: .bottom))
                        }
                        
                        
                    })
                }
                //16. Lo tunearemos un poco mas dandole color a la Screollview
                .shadow(color: Color(.sRGB, red: 50/255, green: 50/255, blue: 50/255, opacity: 0.3), radius: self.isFullContent ? 0 : 16)
                
                //18, configuraremos el boton de cierre, siempre y cuando este a pantalla completa
                if self.isFullContent {
                    HStack{
                        Spacer()
                        //19. Creamos el boton
                        Button{
                            //20. COmo tenemos que cerrar le metemos una animacion, pasando isFullContent a falso
                            withAnimation(.easeInOut){
                                self.isFullContent = false
                            }
                        } label: {
                            //21. Pondremos una imagen de X
                            Image(systemName: "multiply.circle.fill")
                                .font(.system(size: 30))
                                .foregroundStyle(Color.gray)
                                .opacity(0.7)
                        }
                        //22. Le agregamos un pading al boton
                        .padding(16)
                    }
                }
            }
        }
    }
}

//4. Creamos nuestras preview para ambos casos
#Preview("Tarjeta sin contenido") {
    CardView(category: articles[2].category,
             title: articles[2].title,
             subtitle: articles[2].excerpt,
             image: UIImage(named: articles[2].image)!,
             isFullContent: .constant(false))
}

#Preview("Tarjeta con contenido") {
    CardView(category: articles[2].category,
             title: articles[2].title,
             subtitle: articles[2].excerpt,
             image: UIImage(named: articles[2].image)!,
             //17. Agregamos el contenido en la vercion full
             content: articles[2].content,
             isFullContent: .constant(true))
}
