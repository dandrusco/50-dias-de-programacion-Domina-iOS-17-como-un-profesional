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
            
            //7. Creamos el titulo, vinculado a la variable $title
            TextField("Introduce al descripción de la tarea", text: self.$title) { editingChanged in
                //8. Si editamos algo se lo pasamos a la isEditing
                self.isEditing = editingChanged
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(16)
            .padding(.bottom)
            
            //9. Creamos la prioridad
            Text("Prioridad")
                .font(.system(.headline, design: .rounded))
                .padding(.bottom)
            
            //10. Pondremos 3 textos, para ello creamos una HStack
            HStack{
                //11. Para la prioridad alta
                Text("Alta")
                    .font(.system(.headline, design: .rounded))
                    .padding(16)
                    //12. Comprobaremos si es la prioridad que tenemos seleccionada para el color
                    .background(self.priority == .high ? Priority.high.color() : Color(.systemGray4))
                    .foregroundStyle(.white)
                    .cornerRadius(12)
                    //13. Si esta cliqueado, la prioridad sera alta
                    .onTapGesture {
                        self.priority = .high
                    }
                
                //14. Lo mismo para la media
                Text("Media")
                    .font(.system(.headline, design: .rounded))
                    .padding(16)
                    .background(self.priority == .normal ? Priority.normal.color() : Color(.systemGray4))
                    .foregroundStyle(.white)
                    .cornerRadius(12)
                    .onTapGesture {
                        self.priority = .normal
                    }
                //15. Para la prioridad Baja
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
            //16. Metemos un padding
            .padding(.bottom)
            
            //20. Creamos un boton para guardar
            Button(action: {
                //21. Quitaremos lo espacios en blancos que puedan haber
                if self.title.trimmingCharacters(in: .whitespaces) == "" {
                    //22. Si es asi, no devolveremos nada ya que no podemos guardar una tarea vacia
                    return
                }
                //23 de lo contrario el isShow pasa a ser falso
                self.isShow = false
                //24. Creamos una nueva tarea donde le pasamos el titulo y la prioridad
                self.addNewTask(title: self.title, priority: self.priority)
            //25. Configurarmos la label del boton
            }, label: {
                Text("Guardar Tarea")
                    .font(.system(.headline, design: .rounded))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(.teal)
                    .foregroundStyle(.white)
                    .cornerRadius(16)
            })
            //26. Metemos un
            .padding(.bottom)
        }
        //27.Meteremos un padin a todo
        .padding()
        .background(.white)
        .cornerRadius(16, antialiased: true)
        //28. Moveremos todo esto si el valor de isEditing es true
        .offset(y: self.isEditing ? -320 : 0)
        .edgesIgnoringSafeArea(.bottom)
        //29. Ignaramos la parte segura
    }
    
    //17.Configuraremos la funcion para las nuevas tareas, donde tendra un titulo, una prioridad y si esta completo o no...
    private func addNewTask(title: String, priority: Priority, isCompleted: Bool = false){
        //18. Creamos la tarea
        let task = Task(title: title, priority: priority, isCompleted: isCompleted)
        //19. Lo añaimos a los arrays de las tareas
        self.task.append(task)
    }
}

#Preview {
    NewTaskView(isShow: .constant(true),
                task: .constant([]),
                title:"",
                priority: .normal)
}

