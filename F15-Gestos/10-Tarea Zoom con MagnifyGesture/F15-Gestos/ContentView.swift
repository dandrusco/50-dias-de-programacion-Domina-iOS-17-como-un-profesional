//
//  ContentView.swift
//  F15-Gestos
//
//  Created by Danilo Andrusco on 20-05-24.
//

import SwiftUI

struct ContentView<Content>: View where Content: View {
    
    var content: () -> Content

    //2. Eliminaremos estos estados para crear un nuevodel factor de escalado
    /*@GestureState private var dragState = DragSate.inactive
    @State private var currentPosition = CGSize.zero*/
    @GestureState private var scaleFactor: CGFloat = 1.0
    
    var body: some View {
        content()
            //3. Crearemos un factuor de scala pasandole el scaleFactor
            .scaleEffect(scaleFactor)
            //4. Eliminaremos la opacidad y el offset
            /*.opacity(self.dragState.isTapped ? 0.5: 1.0)
            .offset(x: self.currentPosition.width + self.dragState.translation.width, y: self.currentPosition.height + self.dragState.translation.height)*/
            //5. En cuanto a la animacion ocuparemos la misma pero el valor sera sacado del scaleFactor
            .animation(.easeInOut, value: scaleFactor)
            .gesture(
                //6. En el gesto utilizaremos el MagnifyGesture
                MagnifyGesture()
                //7. Tanto el LongPressGesture como el sequenced no lo utilizaremos
                /*LongPressGesture(minimumDuration: 1.0)
                    .sequenced(before: DragGesture())*/
                    //8. EL $dragState sera del $scaleFactor
                    .updating(self.$scaleFactor, body: { value, state, transaction in
                        //9. COmo solo cambiaremos un numero float nos cargaremos el switch
                        /*switch value{
                        case .first(true):
                            state = .pressiong
                        case.second(true, let drag):
                            state = .dragging(translation: drag? .translation ?? .zero)
                        default:
                            break
                        }*/
                        //10 El State pasara a ser el valor del magnification
                        state = value.magnification
                    })
                    //11. El onEnded no es necesario programarlo ya que no es parte de la tarea
                    /*.onEnded({ value in
                        guard case .second(true, let drag?) = value else { return }
                        self.currentPosition.height += drag.translation.height
                        self.currentPosition.width += drag.translation.width
                    })*/
                
                //12. COn la tecla options del teclado precionada podremos arrastras para agrandar o disminuir el logo de apple 
            )
    }
}

#Preview {
    ContentView(){
        //1. Diseñaremos una imagen de apple de tamaño 100 y color teal
       Image(systemName: "apple.logo")
            .font(.system(size: 100))
            .foregroundStyle(.teal)
    }
}
