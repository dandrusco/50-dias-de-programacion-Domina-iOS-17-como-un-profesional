//
//  ContentView.swift
//  F15-Gestos
//
//  Created by Danilo Andrusco on 20-05-24.
//


//1. No solo podemos arrastrar imagernes, tambien podria ser un texto por ejemplo, para ello crearemos  una vista generica que nos permita arrastrar lo que nosotros queramos
import SwiftUI

//2. Nuestra estructura ContentView, ademas de ser una vista le proporcionaremos un contenido
struct ContentView<Content>: View where Content: View {
    
    //3. Crearemos una variable llamada content que en su interior devolvera un objeto de la clase Content
    var content: () -> Content

    @GestureState private var dragState = DragSate.inactive
    @State private var currentPosition = CGSize.zero
    
    var body: some View {
        //5. Cortaremos la imagen hasta el foregroundStyle
        /*Image(systemName: "book.circle.fill")
            .font(.system(size: 100))
            .foregroundStyle(.teal)*/
        
        //7. Deberemos llamar al contenido
        content()
            .opacity(self.dragState.isTapped ? 0.5: 1.0)
            .offset(x: self.currentPosition.width + self.dragState.translation.width, y: self.currentPosition.height + self.dragState.translation.height)
            .animation(.easeInOut, value: self.dragState.translation)
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .sequenced(before: DragGesture())
                    .updating(self.$dragState, body: { value, state, transaction in
                        switch value{
                        case .first(true):
                            state = .pressiong
                        case.second(true, let drag):
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
    //4. Deberemos pasarle una imagen de prueba, por lo tanto copiaremos los mismos parametros de la imagen, por lo tanto deberemos poner estas llaves {}
    ContentView(){
        //6. Lo pegamos a continuacion
        Image(systemName: "book.circle.fill")
            .font(.system(size: 100))
            .foregroundStyle(.teal)
    }
}
