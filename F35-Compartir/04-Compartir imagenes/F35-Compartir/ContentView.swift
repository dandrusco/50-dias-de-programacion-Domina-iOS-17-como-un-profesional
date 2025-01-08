//
//  ContentView.swift
//  F35-Compartir
//
//  Created by Danilo Andrusco on 08-01-25.
//

//1. En la carpeta de recursos hay una foto llamada juangabriel, la arrastraremos hasta los Assets
import SwiftUI

struct ContentView: View {
    
    private let url = URL(string: "https://cursos.frogamesformacion.com/pages/blog")!
    
    //2. Creamos la constate privada para la foto
    private let image = Image("juangabriel")
    
    var body: some View {
        //3. Alinearemos la VStack
        VStack(alignment: .leading, spacing: 24) {
            
            //4. LLamamos a la imagen
            self.image
                .resizable()
                .scaledToFit()
            //5. Crearemos otro link para compartir pero esta vez de la foto, en preview le podemos poner un titulo
            ShareLink(item: self.image,
                      preview: SharePreview("Mira la nueva foto de Juan Gabriel", image: self.image))

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
