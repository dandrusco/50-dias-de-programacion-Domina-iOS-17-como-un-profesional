//
//  CardView.swift
//  F17-Tinder
//
//  Created by Danilo Andrusco on 20-08-24.
//

import SwiftUI

//3. Para poder iterar deben identificarte unicamente, por lo tanto deberemos meter el protocolo Identifiable
struct CardView: View, Identifiable {
    
    //4. la declararemos en una variable
    let id = UUID()
    
    //2. Crearemos las dos variables tanto para la imagen como para el nombre
    let name: String
    let image: String
    
    var body: some View {
        //6. Confiruraremos la imagen
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .cornerRadius(24)
            .padding(.horizontal, 24)
            //7. Configuramos el texto en un Overlay
            .overlay(alignment: .bottom){
                Text(name)
                    .font(.system(.title2, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .background(.teal)
                    .cornerRadius(16)
                    .padding(.bottom, 24)
            }
        
    }
}

#Preview {
    //5. Para que no se nos queje la Preview debeeremos pasarle un nombre y una imagen
    CardView(name: "Curso de Algebra Lineal", image: "algebralineal")
}
