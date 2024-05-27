//
//  ContentView.swift
//  F15-Gestos
//
//  Created by Danilo Andrusco on 20-05-24.
//


//1. Vamos a crear un enumerado, para ello crearemos un nuevo fichero de Swift que llamaremos DragState
import SwiftUI

struct ContentView: View {
    
    //11. En lugar de tener un isTapped y dragOffset lo cambiaremos por el enumerado
    /*@GestureState private var isTapped = false
    @GestureState private var dragOffset = CGSize.zero*/
    
    //12. Crearemos un @GestureState para el DragState que en principio estara inactivo
    @GestureState private var dragState = DragSate.inactive
    @State private var currentPosition = CGSize.zero
    
    var body: some View {
        Image(systemName: "book.circle.fill")
            .font(.system(size: 100))
            .foregroundStyle(.teal)
            //13. Ahora la opacidad ya no sera del self.isTapped si no mas bien del self.dragState.isTapped
            .opacity(self.dragState.isTapped ? 0.5: 1.0)
            //14. La dragOffset ahora la hemos llamado translation, por lo tanto quedaria self.dragState.translation tanto para la anchura como la altura
            .offset(x: self.currentPosition.width + self.dragState.translation.width, y: self.currentPosition.height + self.dragState.translation.height)
            //15. La animacion asociada al dragOffset la daria el  self.dragState.translation
            .animation(.easeInOut, value: self.dragState.translation)
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    //16. Este primer updating no lo vamos a necesitar
                    /*.updating(self.$isTapped, body: { value, state, transaction in
                            state = value
                    })*/
                    .sequenced(before: DragGesture())
                    //17. En vez del $dragOffset debera ser
                    .updating(self.$dragState, body: { value, state, transaction in
                        switch value{
                        case .first(true):
                            //18. En lugar de copolar pulsado
                            /*print("Pulsado!")*/
                            //19. Pondremos que el estado actual es igual al .pressiong ya que nos encontramos en el LongPressGesture (presionado)
                            state = .pressiong
                        case.second(true, let drag):
                            //20. Eliminaremos este state por que ahora si se esta moviendo significa que e deberemos pasar la traslacion que hemos recuperado
                            /*state = drag?.translation ?? .zero*/
                            //21. Si al drag le podemos sacar el valor se lo entregamos y de lo contrario sera cero
                            state = .dragging(translation: drag? .translation ?? .zero)
                        default:
                            break
                        }
                    })
                    .onEnded({ value in
                        guard case .second(true, let drag?) = value else { return }
                        self.currentPosition.height += drag.translation.height
                        self.currentPosition.width += drag.translation.width
                    })
            )
    }
}

#Preview {
    ContentView()
}
