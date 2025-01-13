//
//  BlankView.swift
//  F38-Cuadricula
//
//  Created by Danilo Andrusco on 13-01-25.
//


import SwiftUI

struct BlankView: View {
    var body: some View {
        //6. Creamos el grid
        Grid{
            //7. En la primera fila meteremos 3 imagenes llamando a la funcion pero le cambiaremos la imagen de la camara por la de un rayo
            GridRow{
                ImageCellView(imageName: "bolt.fill")
                ImageCellView(imageName: "bolt.fill")
                ImageCellView(imageName: "bolt.fill")
            }
            
            //8. Creamos la segunda fila pero la columna del medio lo dejaremos en blanco
            GridRow{
                //9. Ponemos la primera imagen del rayo
                ImageCellView(imageName: "bolt.fill")
                //10. Pra no pintar nada, podemos llamar al Color.Clear
                Color.clear
                    //11. Con gridCellUnsizedAxes le podemos quitar el espacio en vertical como en horizontal
                    .gridCellUnsizedAxes([.horizontal, .vertical])
                //11 Insertamos el tercer rayo
                ImageCellView(imageName: "bolt.fill")
            }
            //12 Al final tambien meteremos 3 rayos
            GridRow{
                ImageCellView(imageName: "bolt.fill")
                ImageCellView(imageName: "bolt.fill")
                ImageCellView(imageName: "bolt.fill")
            }
        }
    }
}

#Preview {
    BlankView()
}


//2. Primero crearemos una estrucura afuera llamada ImageCellView
struct ImageCellView: View {
    
    //3. Contendra una camara
    var imageName: String = "camera"
    
    var body: some View {
        //4. Configuraremos la imagen
        Image(systemName: self.imageName)
            .frame(width: 100, height: 100)
            .background(in: Rectangle())
            .backgroundStyle(.teal)
            //5. le meteremos una sombra con shadow
            .foregroundStyle(.white.shadow(.drop(radius: 2, y: 4.0)))
            .font(.system(size: 60))
    }
}
