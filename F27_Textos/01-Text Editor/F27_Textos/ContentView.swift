//
//  ContentView.swift
//  F27_Textos
//
//  Created by Danilo Andrusco on 18-12-24.
//

import SwiftUI

struct ContentView: View {
    
    //1. Creamos una variable de estado para almacenar el texto
    @State private var text = ""
    //10. creamos un segundo estado para el conteo
    @State private var wordCount: Int = 0
    
    var body: some View {
        //2. Creamos una ZStack alineado como topTrailing
        ZStack (alignment: .topTrailing){
            //3. Para acceder a la variable utilizamos TextEditor y debemnos anteponer un $ a la variable
            TextEditor(text: self.$text)
            //4. Con esto ya podemos escribir en el iphone incluso multilinea
            //5. AHora lo podemos editar
                .font(.title2)
                .lineSpacing(24)
            //6. .sentences hace que despues de un punto siempre comience con mayuzculas
                .textInputAutocapitalization(.sentences)
            //7. Para corregir la hortografia
                .autocorrectionDisabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .padding(.all)
                .padding(.top, 24)
            //8. Si añadimos .onChange a un TextEditor, detectara cambios en los estados asociados
            //9. Vamos a realizar un conteo de palabras, para ello le vamos a dar seguimiento a la variable text
                .onChange(of: self.text) {
                    //11 Cuando cambie la variable text, almacenaremos en la variable words,si hay separador de espacio o nuevas lineas...
                    let words = self.text.split { $0 == " " || $0.isNewline}
                    //12. le pasamos a wordCount el conteo de palabras
                    self.wordCount = words.count
                }
            //13. Mostraremos el numero de palabras
            Text("\(self.wordCount) palabras")
                .font(.headline)
                .foregroundStyle(.secondary)
                .padding(.trailing)
        }
    }
}

#Preview {
    ContentView()
}
