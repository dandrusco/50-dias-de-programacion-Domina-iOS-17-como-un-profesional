//
//  ContentView.swift
//  F39-Orientaciones
//
//  Created by Danilo Andrusco on 13-01-25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        
        //1. Si lo probamos en el simulador vemos que en los ultimos iPhone Pro no se rota, para ello lo podemos solucionar con geometry
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height
            
            let layout = isLandscape ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
            
            //2. Esta linea esta de mas
            /*let layout = (self.horizontalSizeClass == .regular) ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())*/
            
            layout {
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
            //3. Agregaremos un font y un frame
            .font(.system(size: 80))

            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ImageCell: View {
   
    var imageName = ""
    var backgroundColor = Color.teal
    
    var body: some View {
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
