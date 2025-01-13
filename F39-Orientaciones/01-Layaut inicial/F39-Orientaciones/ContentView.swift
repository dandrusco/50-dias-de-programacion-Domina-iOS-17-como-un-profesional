//
//  ContentView.swift
//  F39-Orientaciones
//
//  Created by Danilo Andrusco on 13-01-25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //4. Ahora dentro de una VStack metemos los 4 iconos con colores distintos
        VStack {
           ImageCell(imageName: "desktopcomputer",
                     backgroundColor: .teal)
        
            ImageCell(imageName: "laptopcomputer",
                      backgroundColor: .purple)
            
            ImageCell(imageName: "ipad",
                      backgroundColor: .yellow)
            
            ImageCell(imageName: "iphone",
                      backgroundColor: .indigo)
        }
        .padding()
    }
}

//1. Partiremos creando una estructura para poner imagenes
struct ImageCell: View {
    //2. Necesitaremos un nombre y un color
    var imageName = ""
    var backgroundColor = Color.teal
    
    var body: some View {
        //3. Configuramos la imagen
        Image(systemName: self.imageName)
             .font(.system(size: 70))
             .frame(width: 150, height: 150)
             .background(in: RoundedRectangle(cornerRadius: 8))
             .backgroundStyle(self.backgroundColor)
             .foregroundColor(.white)
    }
}

#Preview {
    ContentView()
}
