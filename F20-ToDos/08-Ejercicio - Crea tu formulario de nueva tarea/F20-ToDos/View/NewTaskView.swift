//
//  NewTaskView.swift
//  F20-ToDos
//
//  Created by Danilo Andrusco on 25-11-24.
//

import SwiftUI

struct NewTaskView: View {
    
    @Binding var isShow: Bool
    @Binding var task: [Task]
    
    @State var title: String
    @State var priority: Priority
    @State var isEditing = false
        
    var body: some View {
        //1. Aqui debemos crear la nueva tarea, los apilaremos en una VStack
        VStack{
            //2. Metemos un Spacer()
            Spacer()
            //3. metemos otra VStack alineada a la izquierda
            VStack(alignment: .leading){
                //4. EL texto estara metido en la HStack
                HStack{
                    Text("Añadir una nueva tarea")
                        .font(.system(.title, design: .rounded))
                    Spacer()
                    //5. Añadimos un boton que me toglee el estado del isShow, para poder ocultar la ventana
                    Button(action:{
                        self.isShow = false
                    }) {
                        //6. Creamos una imagen para poder cerrarla de color teal
                       Image(systemName: "xmark")
                            .foregroundStyle(.teal)
                            .font(.title)
                    }
                }
            }.padding()
            
            TextField("Introduce al descripción de la tarea", text: self.$title) { editingChanged in
                self.isEditing = editingChanged
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(16)
            .padding(.bottom)
            
            Text("Prioridad")
                .font(.system(.headline, design: .rounded))
                .padding(.bottom)
            HStack{
                
                Text("Alta")
                    .font(.system(.headline, design: .rounded))
                    .padding(16)
                    .background(self.priority == .high ? Priority.high.color() : Color(.systemGray4))
                    .foregroundStyle(.white)
                    .cornerRadius(12)
                    .onTapGesture {
                        self.priority = .high
                    }
                    
                Text("Media")
                    .font(.system(.headline, design: .rounded))
                    .padding(16)
                    .background(self.priority == .normal ? Priority.normal.color() : Color(.systemGray4))
                    .foregroundStyle(.white)
                    .cornerRadius(12)
                    .onTapGesture {
                        self.priority = .normal
                    }
                
                Text("Baja")
                    .font(.system(.headline, design: .rounded))
                    .padding(16)
                    .background(self.priority == .low ? Priority.low.color() : Color(.systemGray4))
                    .foregroundStyle(.white)
                    .cornerRadius(12)
                    .onTapGesture {
                        self.priority = .low
                    }
            }
            .padding(.bottom)
            
            Button(action: {
                
                if self.title.trimmingCharacters(in: .whitespaces) == "" {
                    return
                }
                
                self.isShow = false
                
                self.addNewTask(title: self.title, priority: self.priority)
                
            }, label: {
                Text("Guardar Tarea")
                    .font(.system(.headline, design: .rounded))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(.teal)
                    .foregroundStyle(.white)
                    .cornerRadius(16)
            })
            .padding(.bottom)
        }
        .padding()
        .background(.white)
        .cornerRadius(16, antialiased: true)
        .offset(y: self.isEditing ? -320 : 0)
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func addNewTask(title: String, priority: Priority, isCompleted: Bool = false){
        let task = Task(title: title, priority: priority, isCompleted: isCompleted)
        modelContext.insert(task)
    }
}

#Preview {
    NewTaskView(isShow: .constant(true),
                task: .constant([]),
                title:"",
                priority: .normal)
}
