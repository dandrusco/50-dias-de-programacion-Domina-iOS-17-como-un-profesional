//
//  ColorsAndSymbolsView.swift
//  F38-Cuadricula
//
//  Created by Danilo Andrusco on 13-01-25.
//


import SwiftUI

struct ColorsAndSymbolsView: View {
    var body: some View {
        //6. Creamos el grid
        Grid{
            //7. En la primera fila meteremos una imagen de foto en tamaño 120 y una imagen de camara en tamaño 60
            GridRow {
                Image(systemName: "photo")
                    .font(.system(size: 120))
                
                Image(systemName: "camera")
                    .font(.system(size: 60))
                
            
            }
            //8. Pondremos otra fila y lo pintaremos de color teal
            GridRow{
                Color.teal
                //9. En un overlay podemos meter una imagen sobre el color
                    .overlay {
                        Image(systemName: "camera.aperture")
                            .font(.system(size: 150))
                            .foregroundStyle(.white)
                    }
                    //10. para que ocupe el ancho de dos columnas utilizamos gridCellColumns
                    .gridCellColumns(2)
            //11. La ventaja de trabajar con Gird es que estas se adaptan por si sola evitando utilizar frame con en el caso de las Stacks
            }
        }
    }
}

#Preview {
    ColorsAndSymbolsView()
}
