//
//  ContentView.swift
//  F18-AppleWallet
//
//  Created by Danilo Andrusco on 12-11-24.
//

import SwiftUI

struct walletView: View {
    
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
                            //1. El TapGesture una vez que acabe de forma exclusiva ir antes del LongPressGesture (el que arranca), con una duracion del 0.1, seguda del DragGesture implementando una actualizacion al dragState, recuperando el valir del estado y la transaccion para crear un swiych
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
                                    //2. Meteremos un onEnded, capturando un unico valor capturando el drag
                                    .onEnded { value in
                                        guard case .second(true, let drag?) = value else {
                                            return
                                        }
                                        
                                        //TODO: Reorganizar las tarjetas
                                    }
                                )
                        )
                }
                .onAppear{
                    self.isCardPresented.toggle()
                }
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
        return -Double(index)
    }
    private func offset(for card: Card) -> CGSize {
        guard let index = self.index(for: card) else{
            return CGSize()
        }
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
        
        return CGSize(width: 0, height: -walletView.cardOffset*CGFloat(index))
        
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
