//
//  ContentView.swift
//  F17-Tinder
//
//  Created by Danilo Andrusco on 20-08-24.
//


//1. Al mover la tarjeta vemos que desaparece la barra de abajo, pero tambien desaparecen todas las tarjetas que deberian quedar por detras, esto es por que la animacion esta implementada a todas las tarjetas
import SwiftUI

struct ContentView: View {
    
    @GestureState private var dragState = DragState.inactive
    
    var cardViews: [CardView] = {
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
                ForEach(self.cardViews) { cardView in
                    
                    //2. Para salucionar este problema crearemos una variable para que invoque a la primera tarjeta (tarjeta actual)
                    let isTop = self.isTopCard(cardView: cardView)
                    
                    cardView
                        //3. al zIndez le pasaremos directamente la variable isTop
                        /*.zIndex(self.isTopCard(cardView: cardView) ? 1: 0)*/
                        .zIndex(isTop ? 1: 0)
                        
                        //4. El offset le preguntaremos si es topcard
                        /*.offset(x: self.dragState.translation.width,
                                y: self.dragState.translation.height)*/
                        .offset(x: isTop ? self.dragState.translation.width : 0.0,
                                y: isTop ? self.dragState.translation.height : 0.0)
                        
                        //5. EN la escala ocuparemos si es la de arriba y la estamos arrastrando
                        /*.scaleEffect(self.dragState.isDreagging ? 0.95 : 1.0)*/
                        .scaleEffect(isTop && self.dragState.isDreagging ? 0.95 : 1.0)
                    
                        //6. Para la rotacion
                        /*.rotationEffect(Angle(degrees: Double(self.dragState.translation.width / 15)))*/
                        .rotationEffect(Angle(degrees: isTop ?  Double(self.dragState.translation.width / 15) : 0))
                        .animation(.interpolatingSpring(stiffness:200, damping: 100), value: self.dragState.translation)
                        .gesture(
                            LongPressGesture(minimumDuration: 0.05)
                                .sequenced(before: DragGesture())
                                .updating(self.$dragState, body: { value,
                                    state, transaction in
                                    switch value {
                                    case .first(true):
                                        state = .pressing
                                    case .second(true, let drag):
                                        state = .dragging(traslation: drag?.translation ?? .zero)
                                    default:
                                        break
                                        
                                    }
                                })
                        )
                }
            }
            Spacer(minLength: 16)
            BottomBar()
                .opacity(self.dragState.isPressing ? 0.0 : 1.0)
                .animation(.easeOut, value: self.dragState.isPressing)
        }
        .padding()
    }
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = self.cardViews.firstIndex(where: {$0.id == cardView.id}) else {
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
