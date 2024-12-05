//
//  SearchBar.swift
//  F20-ToDos
//
//  Created by Danilo Andrusco on 04-12-24.
//

import SwiftUI

#Preview {
    SearchBar(text: .constant(""))
}

struct SearchBar : View {
    
    //1. Podemos crear un Binding, este caso lo hemos declarado como text de tipo string
    @Binding var text: String
    
    //2. Que pasa si queres leer y escribir a partir de ese binging?, por ejemplo como podemos poner todo en mayuzculas lo que el usuario escriba?
    //3. Swift ofrece la opcion de poner todo en mayuzculas, para ello crearemos una variable privada de tipo Binding String
    private var searchText: Binding<String> {
        //4. revolvemos el Binding de tipo String
        Binding<String>(
            //5. Metemos un geter
            get: {
                //6. Tomamos el texto y lo pasamos a mayusculas
                self.text.uppercased()
            },
            //7. Ahora hacemos el set
            set: {
                //8. La variable text sera igual a lo que escribimos
                self.text = $0
            }
        )
    }
    
    @State private var isEditing : Bool = false

    var body: some View {
        HStack{
            //9. ahora debemos modificar la caja de TextField, ya que el valor lo guardabamos en la variable de text, ahora lo guardaremos en el searchText (Sin el dolar ya que no es un binding directo) 
            TextField("Buscar una tarea...", text: self.searchText)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if self.isEditing {
                            Button(action: {
                                self.text = ""
                            }, label: {
                                Image(systemName: "x.circle.fill")
                                    .foregroundStyle(.gray)
                                    .padding(.trailing, 8)
                            })
                        }
                    }
                )
                .padding(.horizontal, 16)
                .onTapGesture {
                    withAnimation {
                        self.isEditing = true
                    }
                }
            
            if self.isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancelar")
                        .foregroundStyle(.teal)
                })
                .padding(.trailing, 12)
                .transition(.move(edge: .trailing))
            }
        }
    }
    
}
