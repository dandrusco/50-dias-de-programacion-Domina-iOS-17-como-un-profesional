//
//  ExpandableTextField.swift
//  F27_Textos
//
//  Created by Danilo Andrusco on 18-12-24.
//

//2. Antes solo se podia en una TextField utilizar solo una linea de texto, ahora permite multilinea, cpm axis le diremos si se puede expandir o no...
import SwiftUI

struct ExpandableTextField: View {
    
    //3. Creamos la variable de estado para el texto
    @State private var text = ""
    
    var body: some View {
        //4. Creamos la TextField, le pondremos un titulo de la TextField, seguido de la variable asociada al texto, continuamos con el prompt que es el texto que vea el usuario, y en axis le diremos que es en vertical
        TextField("Comentario", text: self.$text, prompt: Text("Introduce tu comentario"), axis: .vertical)
        //5. Tambien lo podemos personalizar limitando el numero de lineas, limitando la caja del TextField
            .lineLimit(3...5)
            .padding(16)
            .background(Color.teal.opacity(0.25))
            .cornerRadius(8)
            .padding()
    }
}


#Preview {
    ExpandableTextField()
}
