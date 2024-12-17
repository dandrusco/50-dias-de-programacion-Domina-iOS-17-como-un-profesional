//
//  TaskView.swift
//  F26-Actividad
//
//  Created by Danilo Andrusco on 17-12-24.
//

//2. Ahora creamos otro fichero de Swift File llamado Task
import SwiftUI

struct TaskView: View {
    
    //10. Creamos variable de estado para el promedio del progreso
    @State private var averageProgress = 0.0
    //11. Creamos otra para nuestro arrrays de tareas que configuramos en el archivo Taks
    @State private var tasks = TaskStore().tasks
    
    var body: some View {
        //12. metemos una VStack alineado a la izquierda
        VStack(alignment: .leading, content: {
            //13. El contenido tendra un texto con las tareas diarias
            Text("Tareas Diarias")
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top)
            //14. Metemos una Hstack y en su interior el progreso global
            HStack{
                Text("Progreso Global")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                //15. Un Spacer
                Spacer()
                //16 Con CMD + Shift + l buscamos el ProgressRing Smoll y lo arrastramos aqui, adicialmente le añadiremos el color blanco y el progres sera igual al $averageProgress
                ProgressRing(thickness: /*@START_MENU_TOKEN@*/15.0/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/150.0/*@END_MENU_TOKEN@*/, color: .white, gradient: Gradient(colors: [.darkPurple, .lightPurple]), progress: self.$averageProgress)
            }
            //17. configuramos la HStack
            .padding(.all, 24)
            .background(Color.teal)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .padding(.horizontal)
            
            //18 Configuraremos un LazyVGrid ya que tenemos un arrays de tareas, en las columnas le pasomos el GridItem
            LazyVGrid(columns: [GridItem()], content: {
                //19. En el contenido lo recorreremos con un ForEach pasandole el incie de las tareas
                ForEach(self.tasks.indices, id: \.self){ idx in
                    //20. generamos un TaskProgressView (aun no la hemos creado) pasandole las propias tareas segun su posicion
                    TaskProgressView(task: self.$tasks[idx])
                }
            })
            
            Spacer()
        })
        //36. Cuando aparezca la vista
        .onAppear{
            //37. el averageProgress debe ser igual al task reducido a 0, pero le iremos sumando el progreso dividido de el Double por el conteo de tareas
            self.averageProgress = tasks.reduce(0) {$0 + $1.progress}/Double(self.tasks.count)
        }
        //37. Cuando cambie calquiera de las tareas
        .onChange(of: self.tasks) { oldValue, newValue in
            //38. Realizamos el mismo calculo anterior para que se reclacule
            self.averageProgress = tasks.reduce(0) {$0 + $1.progress}/Double(self.tasks.count)
        }
    }
}

//21. Creamos la estructura TaskProgressView de tipo View
struct TaskProgressView: View{
    //22. Bindeamos las tareas
    @Binding var task: Task
    
    //23. El color a utilizar sera el lightPurple
    var color: Color = .lightPurple
    
    //24. creamos progressText de tipo Sting
    private var progressText: String{
        //25. Creamos la constante para el NumberFormatter, pasandole el .persern pasandole el %
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.percentSymbol = "%"
        
        //26. Lo devolvemos
        return formatter.string(from: NSNumber(value: self.task.progress)) ?? "0"
    }
    
    //27. Sobreescribimos el Body
    var body: some View {
        //28. creamos otro VStack
        VStack(alignment: .leading, content: {
            //29 Un Hstack
            HStack{
                //30. Ponemso el nombre y el progreso
                Text(self.task.name)
                    .font(.system(.headline, design: .rounded))
                
                Text(self.progressText)
                    .font(.system(.headline, design: .rounded))
                    .foregroundStyle(self.color.opacity(0.75))
            }
            //31. Ponemos una segunda HStack 
            HStack{
                //32. Ponemos un texto con 0%
                Text("0%")
                    .font(.system(.subheadline, design: .rounded))
                //33. Creamos el slider del asociado a las task.progress del rango de valores del 0 al 1 en intervalos de 0.05, y le pondremos el color
                Slider(value: self.$task.progress, in: 0...1, step: 0.05)
                    .accentColor(self.color)
                //34. Ponemos ahora el 100%
                Text("100%")
                    .font(.system(.subheadline, design: .rounded))
            }
        })
        //35. Configuramos un pading, un color con la opacidad, redondeados y co otro pading en horizontal
        .padding(.all)
        .background(Color.teal.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 24.0, style: .continuous))
        .padding(.horizontal)
    }
}



#Preview {
    TaskView()
}
