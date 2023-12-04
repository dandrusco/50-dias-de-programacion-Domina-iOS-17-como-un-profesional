//
//  CardView.swift
//  F04-ScrollViews
//
//  Created by Danilo Andrusco on 04-12-23.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        //3. Eliminaremos el teecto que trar por dejecto
        
        //4. Crearemos una VStack
        VStack{
            //5.Insertaremos una imagen
            Image("swift5")
                .resizable()
                .aspectRatio(contentMode: .fit)
            //6. Apilaremos 3 textos en una VStack alineado a la izquierda y el corlor sera primario y secundario (colores de sistema), esto nos sirve para ir cambiando de modo claro a modo oscuro
            VStack(alignment: .leading){
                Text("Curso de Swift 5")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundStyle(.secondary)
                
                Text("Aprende el lenguaje de programacion de Apple desde cero")
                    .font(.title2)
                    .foregroundStyle(.primary)
                    .lineLimit(3)
                
                Text("Nivel facil")
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }
            //7. Lwe pondremos un paddong
            .padding()
        }
        //8. A la CardView le pondremos un borde
        .cornerRadius(16)
        //9. Podemos apreciar que a la tarjeta quedo redondeada en sus esquinas, pero abajo no podemos corroborarlo, para ello pondremos un overlay, para poner un rectangulo del mismo tañamo, pintandolo y poniendole opacidad
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(.sRGB, red: 140/255, green: 140/255, blue: 140/255, opacity: 0.6), lineWidth: 2)
        )
        //10. Le pondremos 2 padding dentro de un array
        .padding([.top, .horizontal])
    }
}

#Preview {
    CardView()
}
