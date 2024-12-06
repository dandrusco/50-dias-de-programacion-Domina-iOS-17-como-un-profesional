//
//  CardView.swift
//  F22-AppStoreAnim
//
//  Created by Danilo Andrusco on 05-12-24.
//

import SwiftUI

struct TitleView: View {
    
    //6.Crearemos las variables de categorias, titulo y subtitulo
    let category: String
    let title: String
    let subtitle: String
    
    //7. crearemos una variable para ver si el contenido esta a pantalla completaa
    @Binding var isFullContent: Bool
    
    
    var body: some View {
        //9. Creamos el diseño, metiendo una VStack alineada con leading, segudo de un Spacer
        VStack(alignment: .leading){
            Spacer()
            //10. Crearemos un rectangulo
            Rectangle()
                .frame(minHeight: 100, maxHeight: 150)
                .foregroundStyle(Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 0.5))
                //11. Dentro de un overlay meteremos una HStack, segido de una VStack
                .overlay(
                    HStack{
                        VStack(alignment: .leading, content: {
                            //12. Meteremos el texto de la categoria
                            Text(self.category.uppercased())
                                .font(.subheadline)
                                .bold()
                                .foregroundStyle(Color.secondary)
                            //13. Añadimos el titulo
                            Text(self.title)
                                .font(.title)
                                .bold()
                                .foregroundStyle(Color.primary)
                                .minimumScaleFactor(0.2)
                                .lineLimit(2)
                                .padding(.bottom, 8)
                            //14. Si no es full (pantalla completa) configuraremos el subtitulo
                            if !self.isFullContent {
                                Text(self.subtitle)
                                    .font(.subheadline)
                                    .foregroundStyle(Color.primary).minimumScaleFactor(0.7)
                                    .lineLimit(3)
                            }
                        })
                        //15. Metemos un pading y un spacer
                        .padding()
                        
                        Spacer()
                    }
                )
        }
    }
}

//8. Arreglaremos el error de la Preview
#Preview {
    TitleView(category: "Novedades", title: "Lanzamiento de iOS17", subtitle: "Hemos lanzado nuevo curso", isFullContent: .constant(false))
}

//16. La preview de arriba nos sirve para ver una descripcion corta, crearemos otra que sea mas larga, que por ahora solo sera identica pero True
#Preview {
    TitleView(category: "Novedades", title: "Lanzamiento de iOS17", subtitle: "Hemos lanzado nuevo curso", isFullContent: .constant(true))
}
