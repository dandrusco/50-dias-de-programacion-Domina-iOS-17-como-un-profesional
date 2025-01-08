//
//  ContentView.swift
//  F35-Compartir
//
//  Created by Danilo Andrusco on 08-01-25.
//

import SwiftUI

struct ContentView: View {
    
    private let url = URL(string: "https://cursos.frogamesformacion.com/pages/blog")!
    
    //8. En lugar de pasarle la foto asi, implementaremos una Photo donde le pasaremos los parametros de image, titulo y descripcion
    /*private let image = Image("juangabriel")*/
    private let photo = Photo(image: Image("juangabriel"), title: "Juan Gabriel", description: "Foto de Juan Gabriel en su estudio")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            
            //9. Ahora en ves de llamarla como self.image debemos llamarla:
            self.photo.image
                .resizable()
                .scaledToFit()
            
            //1. Ademas de Textos, URL e imagenes, el parametro de item de ShareLink acepta cualquier objeto que se conforme al protocolo Transferable
            //2. Vamos a crear un nuevo fichero de SwiftUI llamado Photo
            
            //10. Modificamos el  item: self.image a item: self.photo y en la preview quedar tambien como image: self.photo.image
            ShareLink(item: self.photo,
                      preview: SharePreview("Mira la nueva foto de Juan Gabriel", image: self.photo.image))

            ShareLink(item: url,
                      subject: Text("¡Comprueba este link!"),
                      message: Text("¡Si quieres aprender a programar, debes ver esta web!")) {
                Label("Toca para compartir", systemImage: "square.and.arrow.up.circle.fill")
                    .font(.system(size: 20))
                    .foregroundStyle(.teal)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
