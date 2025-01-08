//
//  ContentView.swift
//  F35-Compartir
//
//  Created by Danilo Andrusco on 08-01-25.
//

import SwiftUI

struct ContentView: View {
    
    private let url = URL(string: "https://cursos.frogamesformacion.com/pages/blog")!
    
    
    var body: some View {
        VStack() {
            //1. Una vez creado el ShareLink podemos utilizar un clouser para ello tenemos que abrir y cerrar las llaves {}, adicionalmente podemos en el propio ShareLink poner un asunto y un mensaje
            ShareLink(item: url,
                      subject: Text("¡Comprueba este link!"),
                      message: Text("¡Si quieres aprender a programar, debes ver esta web!")) {
                //2. COnfiguraremos una label con un texto y cambiaremos la imagen de compartir por otra de los SFSimbols
                Label("Toca para compartir", systemImage: "square.and.arrow.up.circle.fill")
                    //3. La agrandaremos y la pintaremos
                    .font(.system(size: 20))
                    .foregroundStyle(.teal)
                //3. Probaremos el boton y le daremos comprartir en las notas para que apreciemos como aparee el texto del ShareLink
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
