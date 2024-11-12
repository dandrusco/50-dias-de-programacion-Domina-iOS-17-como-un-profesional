//
//  ContentView.swift
//  F17-Tinder
//
//  Created by Danilo Andrusco on 20-08-24.
//


import SwiftUI

struct ContentView: View {
    
    @GestureState private var dragState = DragState.inactive
    //1.0 Vamos a programar para ver en que direccion movemos las tarjetas, para ello crearemos una constante de 100 puntos
    private let dragThreshold : CGFloat = 100.0
    
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
                    
                    let isTop = self.isTopCard(cardView: cardView)
                    
                    cardView
                        .zIndex(isTop ? 1: 0)
                        //2. Para pintar el icono sobre la tarjeta ocuparemos un overlay
                        .overlay{
                            ZStack{
                                //3. Configuraremos la X
                                Image(systemName: "xmark.circle")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 120))
                                    //4. Si nos pasamos por dejajo del dragThreshold y ademas que sea la de arriba la opacidad sera 1
                                    .opacity(self.dragState.translation.width < -self.dragThreshold && isTop ? 1.0 : 0.0)
                                
                                //5. Lo mismo para el corazon
                                Image(systemName: "heart.circle")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 120))
                                    //3. Si nos pasamos por Arriba del dragThreshold y ademas que sea la de arriba
                                    .opacity(self.dragState.translation.width > self.dragThreshold && isTop ? 1.0 : 0.0)
                            }
                        }
                        .offset(x: isTop ? self.dragState.translation.width : 0.0,
                                y: isTop ? self.dragState.translation.height : 0.0)
                        .scaleEffect(isTop && self.dragState.isDreagging ? 0.95 : 1.0)
                    
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
