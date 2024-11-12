//
//  ContentView.swift
//  F15-Gestos
//
//  Created by Danilo Andrusco on 20-05-24.
//

import SwiftUI

struct ContentView<Content>: View where Content: View {
    
    var content: () -> Content

    @GestureState private var dragState = DragSate.inactive
    @State private var currentPosition = CGSize.zero
    
    var body: some View {
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
    ContentView(){
        //1. Ahora ya tenemos una vista generica, podemos eliminar esta imagen
        /*Image(systemName: "book.circle.fill")
            .font(.system(size: 100))
            .foregroundStyle(.teal)*/
        //2. AHora crearemos un texto
        Text("TecTroya")
            .font(.system(size: 50, weight: .bold, design: .rounded))
            .foregroundStyle(.teal)
        //3. Lo mantenemos pulsado y lo podemos mover
    }
}
