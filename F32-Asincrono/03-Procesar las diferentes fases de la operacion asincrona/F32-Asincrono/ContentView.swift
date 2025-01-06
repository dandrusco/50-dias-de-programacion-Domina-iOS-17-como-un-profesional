//
//  ContentView.swift
//  F32-Asincrono
//
//  Created by Danilo Andrusco on 06-01-25.
//

import SwiftUI

struct ContentView: View {
    
    let imageURL = "https://import.cdn.thinkific.com/630745%2Fcustom_site_themes%2Fid%2FGbgsVDDrT4uAGrrQShBC_juan-gabriel-gomila.jpg"
    
    var body: some View {
        VStack {
            //1. cambiaremos el image por phase
            AsyncImage(url: URL(string: self.imageURL)){ phase in
                //2. Creamos un Switch para los diferentes casos
                switch phase {
                    //3. EL primer caso es empty, antes de que la imagen se cargue
                case .empty: //4. Actúa a modo de placeholder
                    Color.teal.opacity(0.3)
                //5. Segundo caso de exito recuperamos la imagen y la configuramos
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .transition(.slide)
                //5. El de fracaso pondremos una imagen de icono y la configuramos
                case .failure(_):
                    Image(systemName: "exclamationmark.icloud")
                        .resizable()
                        .scaledToFit()
                //6. Por defecto en caso de que no caiga en los casos anteriores, pondremos otro icono y lo configuramos
                @unknown default:
                    Image(systemName: "xmark.icloud.fill")
                        .resizable()
                        .scaledToFit()
                }
                    

            }
            //4. Eliminamos el placeholder
            /*placeholder: {
                Color.teal.opacity(0.3)
            }*/
            .frame(width: 320, height: 520)
            .cornerRadius(24)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
