//
//  SearchBar.swift
//  F20-ToDos
//
//  Created by Danilo Andrusco on 04-12-24.
//

//1. Hasta ahora si el usuario escribe algo en la barra de busqueta este no hace nada
import SwiftUI

#Preview {
    SearchBar(text: .constant(""))
}

struct SearchBar : UIViewRepresentable {
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchbar =  UISearchBar()
        
        searchbar.searchBarStyle = .minimal
        searchbar.autocapitalizationType = .none
        searchbar.placeholder = "Buscar una tarea..."
        
        //11. Ahora deberemos adaptarnos a este protocolo, indicandole que el delegado es el coordinator
        searchbar.delegate = context.coordinator
    
        return searchbar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = self.text
    }
    
    //2. Para solucionar esto deberemos crear una funcion makeCoordinator, quien nos devolvera un coordinador, esta se utiliza para ver cambios de una vista a otra
    func makeCoordinator() -> Coordinator {
        //3. Devolvermos una instancia del coordinador del texto
        Coordinator(text: self.$text)
    }
    
    //4. Creamos una clase coordinador que herede de NSObject con en protocolo UISearchBarDelegate
    class Coordinator: NSObject, UISearchBarDelegate {
        //5. debe trabajar con una variable vinculada de tipo texto
        @Binding var text: String
        
        //6. creamos su construncor bindeado
        init(text: Binding<String>) {
            self._text = text
        }
        
        //7.Creamos una funcion searchBar quien necesita la barra de busqueda y el texto que ha cambiado
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            //8. Mostraremos el boton de borrar
            searchBar.showsCancelButton = true
            //9. Copiamos el texto de la barra
            self.text = searchText
            
            //10. imprimimos el nuevo texto a modo de pruebas
            print("El nuevo texto es: \(text)")
        }
        
        //12. Nos vamos a la Contectview y si escribimos Hola, vemos que nos imprime por pantalla que el nuevo texto es H, luego aparece la O y asi sucesivamente. Pero que el boton cancelar no esta funcionadno, para ello lo vamos a programar, para ello creamos la funcion searchBarCancelButtonClicked
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            //13. Al momento de ccanelar el texto debe quedar vacio
            self.text = ""
            //14. Si canelamos eliminamos el teclado
            searchBar.resignFirstResponder()
            //15. Como cacelamos, ocultamos el boton
            searchBar.showsCancelButton = false
            //16. Eliminamos el modo de edicion
            searchBar.endEditing(true)
        }
        //17. Como eliminamos todo lo relacioado al boton cancelar una vez que lo precionamos, tambien necesitamos que regrese si el usuario vuelve a escribir
        func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
            //18. Por lo tanto si va a escribir pasamos el boton a visible
            searchBar.showsCancelButton = true
            //19. Devolvemos true
            return true
            //20. Volvemos a realizar las pruebas 
        }
    }
    
}
