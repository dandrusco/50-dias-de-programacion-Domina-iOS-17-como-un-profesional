//
//  ContentView.swift
//  F17-Tinder
//
//  Created by Danilo Andrusco on 20-08-24.
//


import SwiftUI

struct ContentView: View {
    
    @GestureState private var dragState = DragState.inactive
    
    private let dragThreshold : CGFloat = 100.0
    
    @State private var lasCardIndex = 1
    //4. Necesitamos crear una variable de estado para estas nuevas animacion de abajo a la izquierda
    @State private var finalTransition = AnyTransition.leadingBotton
    
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(name: courses[index].name, image: courses[index].image))
        }
        return views
    }()
    
    private func moveCard(){
        self.cardViews.removeFirst()
        self.lasCardIndex += 1
        
        let course = courses[self.lasCardIndex % courses.count]
        let newCard = CardView(name: course.name, image: course.image)
        self.cardViews.append(newCard)
        
    }
    
    
    var body: some View {
        VStack {
            TopBar()
            ZStack{
                ForEach(self.cardViews) { cardView in
                    
                    let isTop = self.isTopCard(cardView: cardView)
                    
                    cardView
                        .zIndex(isTop ? 1: 0)
                        .overlay{
                            ZStack{
                                Image(systemName: "xmark.circle")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 120))
                                    .opacity(self.dragState.translation.width < -self.dragThreshold && isTop ? 1.0 : 0.0)
                                
                                Image(systemName: "heart.circle")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 120))
                                    .opacity(self.dragState.translation.width > self.dragThreshold && isTop ? 1.0 : 0.0)
                            }
                        }
                        .offset(x: isTop ? self.dragState.translation.width : 0.0,
                                y: isTop ? self.dragState.translation.height : 0.0)
                        .scaleEffect(isTop && self.dragState.isDreagging ? 0.95 : 1.0)
                    
                        .rotationEffect(Angle(degrees: isTop ?  Double(self.dragState.translation.width / 15) : 0))
                        .animation(.interpolatingSpring(stiffness:200, damping: 100), value: self.dragState.translation)
                        //5. Antes del gesto lo debemos llamar pasandole el finaltransition que creamos
                        .transition(self.finalTransition)
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
                                //6. Deberemos guardar si el estado es de tipo lleading o traing a travez del onChanged
                                .onChanged({ value in
                                    //7. Utilizaremos un guard case, para estar segunros que estamos en el segundo caso (toque largo)
                                    guard case .second(true, let drag?) = value else { return }
                                    //8.Si devuelve true
                                    if drag.translation.width < -self.dragThreshold {
                                        self.finalTransition = .leadingBotton
                                    }
                                    if drag.translation.width > self.dragThreshold {
                                        self.finalTransition = .trailingBotton
                                    }
                                })
                                .onEnded({ value in
                                    guard case .second(true, let drag?) = value else { return }
                                    if drag.translation.width < -self.dragThreshold || drag.translation.width > self.dragThreshold {
                                        //9. Debemos meter el .moveCard() dentro del withAnimation
                                        withAnimation {
                                            self.moveCard()
                                        }
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


//1. Crearemos una nueva anumacion tanto para derecha como izquirda para que desaparezcan las tarjetas
extension AnyTransition {
    static var trailingBotton: AnyTransition {
        //2. Creamos una animacion asimetica enfocandonos en desaparecer
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
    }
    //3. Creamos la otra
    static var leadingBotton: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
    }

}
