//
//  ContentView.swift
//  F39-Orientaciones
//
//  Created by Danilo Andrusco on 13-01-25.
//

import SwiftUI

struct ContentView: View {
    //1.Hasta el momento hemos configurado la vertical stack, pero como podemos hacer para que cuando el usuario cliclee la pantalla esta cambie a horizontal?
    //2. Partiremos implementando una variable de estado para el layout horizontal
    @State private var hLayout = false
    
    
    var body: some View {
        
        //3. Crearemos una ccontaste que valide si estamos en horizontal, si es asi se la pasamos al layout como HStackLayout y de lo contrario como VStackLayout
        let layout = self.hLayout ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        
        //4. En vez de invocar a la VStack, llamaremos a la variable layout
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
        //5. Le añadiremos una animacion al cambio de layout
        .animation(.default, value: self.hLayout)
        //6. Necesitamos el para que cambie cada vez que se toque
        .onTapGesture {
            self.hLayout.toggle()
        }
        //7. Ahora cada vez que toquemos una imagen esta cambiara de vertical a horizontal
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
