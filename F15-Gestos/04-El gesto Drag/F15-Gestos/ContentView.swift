//
//  ContentView.swift
//  F15-Gestos
//
//  Created by Danilo Andrusco on 20-05-24.
//


//1. Crearemops el efecto de poder mover el icono por toda la pantalla, para ello vamos a eliminar lo que no nos haga falta
import SwiftUI

struct ContentView: View {
    
    //2. Eliminamos el isTapped
    /*@State private var isTapped = false*/
    
    //3. COmo no queremos medir la pulsacion larga, si no mas bian cuanto se ha movido, le cambiaremos el nombre a dragOffset y en vez de que sea Booleano sera CGSize para ver cuanto se ha movido, indicandole que no se ha movido nada en principio (zero)
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        Image(systemName: "book.circle.fill")
            //4. El tamaño lo bajaremos a la mitad
            .font(.system(size: 100))
            .foregroundStyle(.teal)
            //5. Y en cuento a la opaciodad y todas esas cosas, las eliminaremos
            /*.opacity(self.longPress ? 0.5 : 1.0)
            .scaleEffect(self.isTapped ? 0.5 : 1.0)
            .animation(.bouncy, value: self.isTapped)
            .gesture(
                LongPressGesture (minimumDuration: 1.0)
                    .updating(self.$longPress, body: {
                        (currentState, state, transaction) in
                        state = currentState
                    })
                    .onEnded({ _ in
                        self.isTapped.toggle()
                    })
            )*/
            //6. Aplicaremos el modificador offset donde le pasaremos la X y la Y de la variable dragOffset
            .offset(x: self.dragOffset.width, y: self.dragOffset.height)
            //7. Para el movimeinto utilizaremos el animation con el efectyo easeInOut del valor del dragOffset
            .animation(.easeInOut, value: self.dragOffset)
            //8. Ahora pondremos el gesto añadiendo el DragGesture()
            .gesture(
                DragGesture()
                //9. Deberemos asociarle el updating como en la clase anterior, con la salvedad que en el ejemplo anterior la currentState era de tipo booleano y ahora trabajaremos con el valor
                    .updating(self.$dragOffset, body: { value, state, transaction in
                        //10. En el estado nos quedamos con el valor del movimiento
                        state = value.translation
                        //11. Ahora podemos probar arrastrando el icono y este nos seguira
                    })
            )
        
    }
}

#Preview {
    ContentView()
}
