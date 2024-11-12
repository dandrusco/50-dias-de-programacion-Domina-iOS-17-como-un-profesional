//
//  ContentView.swift
//  F17-Tinder
//
//  Created by Danilo Andrusco on 20-08-24.
//

//1. Crearemos un nuevo fichero de tipo Swift File llamado DragState
import SwiftUI

struct ContentView: View {
    
    //7. Ahora necesitamops capturar, pór lo tanto utilizaremos el GestureState
    @GestureState private var dragState = DragState.inactive
    
    var carViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(name: courses[index].name, image: courses[index].image))
        }
        return views
    }()
    
    var body: some View {
        VStack {
            TopBar()
            ZStack{
                ForEach(self.carViews) { carViews in
                    carViews
                        .zIndex(self.isTopCard(cardView: carViews) ? 1: 0)
                        //8. Calcularemos cuanto se ha movido
                        .offset(x: self.dragState.translation.width,
                                y: self.dragState.translation.height)
                        //9. Necesitamos que la primera tarjeta sea un poco mas pequeña para poder visualizar la que esta por detras
                        .scaleEffect(self.dragState.isDreagging ? 0.95 : 1.0)
                        //10. Configuraremos la rotacion de la pimera
                        .rotationEffect(Angle(degrees: Double(self.dragState.translation.width / 15)))
                        //11. Asociaremos a una animaciom
                        .animation(.interpolatingSpring(stiffness:200, damping: 100), value: self.dragState.translation)
                        //12. Programaremos el gesto
                        .gesture(
                            //13. Pulsaremos prolongadamente unos 0.05 segundos
                            LongPressGesture(minimumDuration: 0.05)
                                .sequenced(before: DragGesture())
                                //14. Lo actualizaremos de acuerdo al valor del estado
                                .updating(self.$dragState, body: { value,
                                    state, transaction in
                                    switch value {
                                    case .first(true):
                                        //15. Estamos precionadno en estos momentos
                                        state = .pressing
                                    case .second(true, let drag):
                                        //16. Estamos moviendonos, en principio opcional
                                        state = .dragging(traslation: drag?.translation ?? .zero)
                                    default:
                                        break
                                        
                                    }
                                })
                        )
                }
            }
            Spacer(minLength: 16)
            //17. Mientras estemos arrastrando no tiene sentido que se muestre la barra de abajo, por lo tanto le añadiremos una opacidad
            BottomBar()
                //18. Mientras este precionada no se vera
                .opacity(self.dragState.isPressing ? 0.0 : 1.0)
                //19. Le meteremos una animacion
                .animation(.easeOut, value: self.dragState.isPressing)
        }
        .padding()
    }
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = self.carViews.firstIndex(where: {$0.id == cardView.id}) else {
            return false
        }
        return index == 0
    }
}

struct TopBar: View {
    var body: some View {
        HStack {
            Image(systemName: "line.3.horizontal")
                .font(.system(size: 35))
                .foregroundStyle(.secondary)
            Spacer()
            Image(systemName: "brain.filled.head.profile")
                .font(.system(size: 40))
                .foregroundStyle(.teal)
            Spacer()
            Image(systemName: "heart.circle")
                .font(.system(size: 35))
                .foregroundStyle(.secondary)
        }
        .padding(24)
    }
}

struct BottomBar: View {
    var body: some View {
        HStack {
            Image(systemName: "xmark")
                .font(.system(size: 35))
                .foregroundStyle(.red)
            Spacer()
            
            Button {
                //TODO: abrir el curso en la web
            } label: {
                Text("Ver el curso")
                    .font(.system(.headline, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    .background(.teal)
                    .cornerRadius(15)
            }
            Spacer()
            
            Image(systemName: "heart")
                .font(.system(size: 35))
                .foregroundStyle(.green)
        }.padding(24)
    }
}

#Preview {
    ContentView()
}

#Preview ("TopBar"){
    TopBar()
}

#Preview ("BottomBar"){
    BottomBar()
}
