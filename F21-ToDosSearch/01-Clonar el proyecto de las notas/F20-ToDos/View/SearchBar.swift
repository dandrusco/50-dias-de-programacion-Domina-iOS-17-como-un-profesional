//
//  SearchBar.swift
//  F20-ToDos
//
//  Created by Danilo Andrusco on 04-12-24.
//

//1. EN el F20 programamos la barra de busqueda mediante UIKit, ahora lo programaremos mediante SwiftUI
import SwiftUI

#Preview {
    SearchBar(text: .constant(""))
}

//2. Para ello respetaremos los nombres de la SearchBar pero en vez de que sea UIViewRepresentable, lo cambiaremos a View
struct SearchBar : View {
    
    //3. SOlo necesitaremos el Baiding, el resto lo eliminamos
    @Binding var text: String
    
    /*func makeUIView(context: Context) -> UISearchBar {
        let searchbar =  UISearchBar()
        
        searchbar.searchBarStyle = .minimal
        searchbar.autocapitalizationType = .none
        searchbar.placeholder = "Buscar una tarea..."
        
        searchbar.delegate = context.coordinator
    
        return searchbar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = self.text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: self.$text)
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            searchBar.showsCancelButton = true
            self.text = searchText
            
            print("El nuevo texto es: \(text)")
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            self.text = ""
            searchBar.resignFirstResponder()
            searchBar.showsCancelButton = false
            searchBar.endEditing(true)
        }
    
        func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
            searchBar.showsCancelButton = true

            return true
        }
    }*/
    
}
