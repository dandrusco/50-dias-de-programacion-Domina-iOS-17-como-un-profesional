//
//  CardView.swift
//  F23-Carrusel
//
//  Created by Danilo Andrusco on 08-12-24.
//

import SwiftUI

struct CardView: View {
    
    //12. Necesitamos un titulo y una imagen
    let title: String
    let imageName: String
    
    //13. Creamos un biding para ver si mostramos la imagen sola o con el nombre del curso (detalles)
    @Binding var showDetails: Bool
    
    var body: some View {
        //16. Creamos una ZStack para el diseño
        ZStack{
            //17. Utilizaremos el GeometryReader para urilizar la totalidad de la pantalla
            GeometryReader { geometry in
                //18. Metemos la imagen y la configuramos
                Image(self.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    //19. configuramos el cornerRadius dependiendo si es a pantalla completa
                    .cornerRadius(self.showDetails ? 0 : 16)
                    //20. Metemos un overlay para el titulo
                    .overlay(
                        Text(self.title)
                            .foregroundStyle(Color.white)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.black)
                            .padding(16)
                            .background(Color.teal)
                            .padding([.bottom, .leading])
                            //21. El overlay dependera de si es false o true el valor de showDetails
                            .opacity(self.showDetails ? 0 : 1 )
                            //22. Configuramos el frame
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                    )
                
            }
        }
    }
}

//14. Creamos la vista para el caso de ser falsa
#Preview("Vista de Tarjeta") {
    CardView(title: "Curso de iOS 10", imageName: "ios10", showDetails: .constant(false))
}

//15. Y creamos la vista para en el caso de ser verdadero los detalles
#Preview("Vista de Pantalla Completa") {
    CardView(title: "Curso de iOS 10", imageName: "ios10", showDetails: .constant(true))
}
