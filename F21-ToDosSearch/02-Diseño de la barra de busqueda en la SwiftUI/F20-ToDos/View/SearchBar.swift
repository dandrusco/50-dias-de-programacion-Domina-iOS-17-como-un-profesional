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
    
    @Binding var text: String
    
    //1. Creamos un estado para ver si se esta editando el texto o no para ver el boton de cancelar
    @State private var isEditing : Bool = false
    
    //2. Creamos el diseño
    var body: some View {
        HStack{
            //3. Creamos una textfield para la busqueda, bindeada a la variable text
            TextField("Buscar una tarea...", text: self.$text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                //4. Pondremos una capa por encima para agregar la imagen de una lupa
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        //5. Si estamos editando....
                        if self.isEditing {
                            //6. Aparecera un boton con una X
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
                //7. Meteremos un padding a todo
                .padding(.horizontal, 16)
                //8. A traves de un onTapGesture meteremos una animacion para pasar la variable isEditing a true
                .onTapGesture {
                    withAnimation {
                        self.isEditing = true
                    }
                }
            
            //8. SI estamos editando....
            if self.isEditing {
                //9. Creamos otro boton pero con el texto de cancelar
                Button(action: {
                    //10. Si cancelamos pasamos la edicion a falso y borramos el texto introducido
                    self.isEditing = false
                    self.text = ""
                    //12. Si nos vamos a la ContentView, lo ejecutamos desde el emulador vemos que al cliquear nos aparece nuestro teclado, pero este no desaparece al momento de cancelar la accion, para ello deberemos llamar a UIApplication y le enviaremos una accion para indicarle si hay un teclado en pantalla, este la elimine
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancelar")
                        .foregroundStyle(.teal)
                })
                //11. Metemos un pading con una transision desde la izquierda
                .padding(.trailing, 12)
                .transition(.move(edge: .trailing))
            }
        }
    }
    
}
