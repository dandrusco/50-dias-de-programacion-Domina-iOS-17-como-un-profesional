//
//  NewTaskView.swift
//  F20-ToDos
//
//  Created by Danilo Andrusco on 25-11-24.
//

import SwiftUI

struct NewTaskView: View {
    
    //12. Para crear la nueva tarea necesito 2 Bindig, una para ver si se esta mostrando o no, y la otra que nos permita poder guardar o insertar la tarea
    @Binding var isShow: Bool
    @Binding var task: [Task]
    
    //13. Tambien necesitaremos de 3 estados, para el titulo, la prioridad y la de editar una tarea
    @State var title: String
    @State var priority: Priority
    @State var isEditing = false
        
    var body: some View {
        Text("Hello, Word!")
    }
}

//14. Arreglaremos la preview para que no nos de error
#Preview {
    NewTaskView(isShow: .constant(true),
                task: .constant([]),
                title:"",
                priority: .normal)
}

//15. Ahora volvemos a la ContentView
