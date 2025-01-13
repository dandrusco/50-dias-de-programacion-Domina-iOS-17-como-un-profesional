//
//  BlankView.swift
//  F38-Cuadricula
//
//  Created by Danilo Andrusco on 13-01-25.
//


import SwiftUI

struct BlankView: View {
    var body: some View {
        //1. En el Grid podemos definir parametros como la alineacion y el espaciado en horizontal como el vertical
        Grid(alignment: .bottom, horizontalSpacing: 0, verticalSpacing: 0) {
            GridRow{
                ImageCellView(imageName: "bolt.fill")
                ImageCellView(imageName: "bolt.fill")
                ImageCellView(imageName: "bolt.fill")
            }
            //2. Si solo queremos configurar una fila, lo hacemos con el padding
            .padding(.bottom, 24)
            
            GridRow{
                ImageCellView(imageName: "bolt.fill")
                Color.clear
                    .gridCellUnsizedAxes([.horizontal, .vertical])
                ImageCellView(imageName: "bolt.fill")
            }
           
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

struct ImageCellView: View {
    
    var imageName: String = "camera"
    
    var body: some View {
        Image(systemName: self.imageName)
            .frame(width: 100, height: 100)
            .background(in: Rectangle())
            .backgroundStyle(.teal)
            .foregroundStyle(.white.shadow(.drop(radius: 2, y: 4.0)))
            .font(.system(size: 60))
    }
}
