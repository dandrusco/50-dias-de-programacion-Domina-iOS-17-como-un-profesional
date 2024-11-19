//
//  ContentView.swift
//  F18-AppleWallet
//
//  Created by Danilo Andrusco on 12-11-24.
//


//1. Como podemos ver ahora poemos mover las tarjetas pero estas no recuerdan donde las dejamos, siempre vuelven a la posicion original, para ello cambiaremos el nombre de las cards, nos vamos al fichero Card
import SwiftUI

struct walletView: View {
    
    //3. Crearemos una variable de estado con un arrays de carsData
    @State var cards: [Card] = cardsData
    
    //MARK: Presentacion de las tarjetas al inicio
    private static let cardOffset: CGFloat = 40.0
    private static let cardTimingOffset: CGFloat = 0.4
    @State private var isCardPresented = false
   
    //MARK: Seleccion de una tarjeta para mostrar el historial
    @State private var isCardPressed = false
    @State private var selectedCard: Card?
    
    //MARK: Cambiar orden de las tarjetas
    @GestureState private var dragState = DragState.inactive
    
    var body: some View {
        VStack {
            TopBar()
            Spacer()
            ZStack{
                ForEach(cards){ card in
                    CardView(card: card)
                        .padding(.horizontal, 24)
                        .offset(self.offset(for: card))
                        .zIndex(self.zIndex(for: card))
                        .id(isCardPresented)
                        .transition(AnyTransition.slide.combined(with: .move(edge: .leading)).combined(with: .opacity))
                        .animation(self.transtitionAnimation(for: card), value: isCardPresented)
                        .gesture(
                            TapGesture()
                                .onEnded({ _ in
                                    withAnimation(.easeOut(duration: 0.5).delay(0.1)){
                                        self.isCardPressed.toggle()
                                        self.selectedCard = self.isCardPressed ? card : nil
                                    }
                                })
                                .exclusively(before: LongPressGesture(minimumDuration: 0.1)
                                    .sequenced(before: DragGesture())
                                    .updating(self.$dragState, body: {
                                        value, state, transaction in
                                        switch value {
                                        case .first(true):
                                            state = .pressing(index: self.index(for: card))
                                        case .second(true, let drag):
                                            state = .dragging(index: self.index(for: card), translation: drag?.translation ?? .zero)
                                        default:
                                            break
                                        }
                                    })
                                             //14. Nos falto un parentesis
                                        .onEnded ({ value in
                                            guard case .second(true, let drag?) = value else {
                                                return
                                            }
                                            //13. Trabajaremos en este TODO para que se reordenen
                                            withAnimation{
                                                self.reorderCars(with: card, offset: drag.translation)
                                            }
                                        })
                                //15. Cierre de parentesis
                                )
                        )
                }
            }
            .onAppear{
                self.isCardPresented.toggle()
            }
            if isCardPressed {
                TransactionHistoryView(currentTransactions: transactions)
                    .padding(16)
                    .transition(.move(edge: .bottom))
            }
            Spacer()
        }
        .padding()
    }
    private func zIndex(for card: Card) -> Double {
        guard let index = self.index(for: card) else {
            return 0
        }
        let defaultIndex = -Double(index)
        
        if let dragIndex = self.dragState.index, index == dragIndex {
            return defaultIndex + Double(self.dragState.translation.height/walletView.cardOffset)
        }
        return defaultIndex
    }
    private func offset(for card: Card) -> CGSize {
        guard let index = self.index(for: card) else{
            return CGSize()
        }
        //MARK: Gestinar la tarjeta pulsada para ver el historial
        if self.isCardPressed {
            guard let selectedCard = self.selectedCard,
                  let selectedIndex = self.index(for: selectedCard) else {
                return CGSize()
            }
            if index >= selectedIndex {
                return CGSize()
            }
            let offset = CGSize(width: 0, height: 800)
            
            return offset

        }
        //MARK: Gestionar el arrastre de la tarjeta por pantalla
        var pressedOffset = CGSize.zero
        var drafOffsetY: CGFloat = 0.0
        
        if let dragIndex = self.dragState.index,
            index == dragIndex{
            pressedOffset.height = self.dragState.isPressed ? -25 : 0
                
            switch self.dragState.translation.width {
            case let width where width < -10:
                pressedOffset.width = -25
            case let width where width > 10:
                pressedOffset.width = 25
            default:
                break
            }
            drafOffsetY = self.dragState.translation.height
        }
        
        return CGSize(width: 0 + pressedOffset.width, height: -walletView.cardOffset*CGFloat(index) + pressedOffset.height + drafOffsetY)
        
    }
    private func index(for card: Card) -> Int? {
        guard let index = cards.firstIndex(where: {$0.id == card.id}) else {
            return nil
        }
        return index
    }
    
    private func transtitionAnimation(for card: Card) -> Animation{
        var delay = 0.0
        if let index = index(for: card){
            delay = Double(cards.count - index) * walletView.cardTimingOffset
        }
        return Animation.spring(response: 0.1, dampingFraction: 0.8, blendDuration: 0.1).delay(delay)
    }
    //4. Crearemos otra funcion para reordenar las tarjetas, con la tarjeta que le indiquemos y sabiendo cuanto la hemos desplazado mediante el offset
    private func reorderCars(with card: Card, offset: CGSize){
        //5. Igual que siempre, necesitamos ver el orden de las tarjetas
        guard let draggedCardIndex = index(for: card) else {
            return
        }
        //6. Por cada punto que baje, retrocede una posicion dentro del array de las tarjetas
        var newCardIndex = draggedCardIndex + Int(-offset.height / walletView.cardOffset)
        //7. Nos vamos a la CardView
        
        //9. Debemos tener cuidado si subimos o bajamos mucho, primero crearemos una variable que nos permita que no nos pasemos hacia arriba
        newCardIndex = (newCardIndex >= cards.count) ? cards.count - 1 : newCardIndex
        //10. Lo mismo pero hacia abajo
        newCardIndex = (newCardIndex < 0) ? 0 : newCardIndex
        //11. Ya tenemos la nueva posicion de la tarjeta, pero ahora nos falta eliminar la otra posicion
        let removeCard = cards.remove(at: draggedCardIndex)
        //12. Ahora hacemos lo contrario
        cards.insert(removeCard, at: newCardIndex)
    }
}

struct TopBar: View {
    var body: some View {
        HStack {
            Text("Cartera")
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            Spacer()
            Image(systemName: "plus.circle.fill")
                .font(.system(.title))
        }
        .padding(.horizontal, 24)
        .padding(.top, 24)
    }
}

#Preview {
    walletView()
}
