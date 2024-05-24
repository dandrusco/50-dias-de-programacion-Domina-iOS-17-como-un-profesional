//
//  ContentView.swift
//  F15-Gestos
//
//  Created by Danilo Andrusco on 20-05-24.
//

//1. Vamos a combinar gestos, para ello modificaremos este codigo

import SwiftUI

struct ContentView: View {
    
    //2. Vamos a necesitar una variable de estado de gestos pero booleana
    @GestureState private var isTapped = false

    @GestureState private var dragOffset = CGSize.zero
    @State private var currentPosition = CGSize.zero
    
    var body: some View {
        Image(systemName: "book.circle.fill")
            .font(.system(size: 100))
            .foregroundStyle(.teal)
            //4. Crearemos el efecto de opacidad cuando este pulsado
            .opacity(self.isTapped ? 0.5: 1.0)
            .offset(x: self.currentPosition.width + self.dragOffset.width, y: self.currentPosition.height + self.dragOffset.height)
            .animation(.easeInOut, value: self.dragOffset)
            .gesture(
                //5. Partiremos con un LongPress
                LongPressGesture(minimumDuration: 1.0)
                    .updating(self.$isTapped, body: { value, state, transaction in
                            state = value
                    })
                    //6. A este updating debe seguirle una secuencia donde le indicaremos que le puede seguir un DragGesture()
                    .sequenced(before: DragGesture())
                //7. Este DragGesture esta demas
                /*DragGesture()*/
                
                    //8. AHora deberemos crear el updating para el DragGesture
                    .updating(self.$dragOffset, body: { value, state, transaction in
                        //9. Ahora deberemos distingir si el drag procede del primer tap o del segundo, para ello deberemos hacer un switch para el valor que nos llegue por parametro
                        switch value{
                        //10. Implementaremos los casos, para el primero:
                        case .first(true):
                            //11. Imprimiremos pulsado
                            print("Pulsado!")
                        //12. Implementaremos el caso para el segundo capturando el drag en una constante
                        case.second(true, let drag):
                            //13. En el State si es posible, nos quedaremso con la traslacion del drag, y en el caso de ser desconocido sera .zerp
                            state = drag?.translation ?? .zero
                        //14. Cada vez que se utiliza un switch debemos poner un defaul, en nuestro caso esta vacio y solo contendra un quiebre en la ejecucion
                        default:
                            break
                        }
                    })
                    .onEnded({ value in
                        //15. Para la parte final deberemos definir como queremos que se actualice la posicion final, la cual solo debe ocurrir cuando haya habido un Drag, para ello lo aseguraremos con un guard que solo si en el segundo caso viene con un true, sera completado el LongPressGesture, en este caso se pueda recuperar el drag a partir del valor, sino devolveremos un return vacio
                        guard case .second(true, let drag?) = value else { return }
                        //16. En el caso de que la linea anterior sea posible, actualizaremos la posicion ( el Drag, no el value)
                        self.currentPosition.height += drag.translation.height
                        self.currentPosition.width += drag.translation.width
                    })
                //17. En resumen: Primero requerimos que el usuario pulse y amntenga pulsado al menos un segundo el icono antes de empezar con el proceso de arrastre (LongPressGesture).
                //18. Luego es el turno de sequenced, que se utiliza para vincular la pulsacion larga (LongPressGesture) con el gesto de arrastre (DragGesture)
                //19. AHora el tanto el Updating como el onEnded tiene tiene valores de LongPressGesture y del DragGesture, para poder diferencial utilizamos un switch con las dos posibilidades (first y second)
                //20. Si se esta gestionadno el primer caso, imprimimos por pantalla Pulsado!
                //21. Si se esta gestionando el segundo caso, trabajaremos con el DragGesture extrayendo el drag para actualizar el dragOffset que es la propiedad de la traslacion
                //22. Cuando el drag finaliza en el onEnded deberemos actualizar la posicion final extrayendo del propio valor el drag. Analizando solo el segundo caso
                
                //23. Para probar que esto funciona, si precionamos el icono (sin soltar) este se vuelve medio transparente pero hasta que este vuelva a su color original no lo podremos movere
            )
    }
}

#Preview {
    ContentView()
}
