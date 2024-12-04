//
//  SearchBar.swift
//  F20-ToDos
//
//  Created by Danilo Andrusco on 04-12-24.
//

import SwiftUI

//2. Eliminaremos estas lineas
/*struct SearchBar: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}*/

#Preview {
    //3. A la preview le pasamos el contenedor con un texto vacio
    SearchBar(text: .constant(""))
}

//4. para crear una estructura debe ser UIViewRepresentable
struct SearchBar : UIViewRepresentable {
    
    //5. Creamos un Binding de texto
    @Binding var text: String
    
    //6. Vamos a tener que sobreescribir la funcion makeUIView,  Configuramos la UIView desde el contexto
    func makeUIView(context: Context) -> UISearchBar {
        //7. Creamos una variable que sea del tipo UISearchBar
        let searchbar =  UISearchBar()
        
        //8. Configuramos el searchbar
        searchbar.searchBarStyle = .minimal
        searchbar.autocapitalizationType = .none
        searchbar.placeholder = "Buscar una tarea..."
        
        //9. Devolvemos la searchbar
        return searchbar
    }
    
    //10. A partir de un contexto actualizamos la vista en función del contexto, ulilizaremos UISearchBar para devolver la barra de busqueda
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        //11.La uiView que recibimos sera de tipo texto, pasandole el propio texto de la bariable bindeada
        uiView.text = self.text
    }
}
//12. Lo implementaremos en la ContetView
