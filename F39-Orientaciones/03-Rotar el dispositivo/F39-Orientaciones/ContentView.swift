//
//  ContentView.swift
//  F39-Orientaciones
//
//  Created by Danilo Andrusco on 13-01-25.
//

//1. Ahora cada vez que tocamos la pantalla cambian los iconos de vertical a horizontal, pero como podemos hacer para que rote el dispositivo?
import SwiftUI

struct ContentView: View {
    
    //2. Para ello deberemos crear una variable de entorno de horizontalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    //3. El estado ya no nos sirve
    /*@State private var hLayout = false*/
    
    
    var body: some View {
        //4. En vez de consultarle a la variable de estado, debemos hacerlo a la variable de entorno, preguntandole si estamos en regular (Regular es el normal y compacto en horizontal)
        let layout = (self.horizontalSizeClass == .regular) ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        
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
        //5. Tanto la animacion como el onTapGesture estan de mas
        /*.animation(.default, value: self.hLayout)
        .onTapGesture {
            self.hLayout.toggle()
        }*/
        .padding()
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
