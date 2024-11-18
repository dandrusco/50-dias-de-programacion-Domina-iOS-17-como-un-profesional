//
//  ContentView.swift
//  F18-AppleWallet
//
//  Created by Danilo Andrusco on 12-11-24.
//

import SwiftUI

struct walletView: View {
    
    private static let cardOffset: CGFloat = 40.0
    private static let cardTimingOffset: CGFloat = 0.4
    @State private var isCardPresented = false
    
    //1. Crearemos 2 estados, uno para ver si la hemos pulsado y la otra por si esta seleccioanda
    @State private var isCardPressed = false
    @State private var selectedCard: Card?
    
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
                        //2. Necesitamos que tengamos un gesture, co su toque de TapGesture
                        .gesture(
                            TapGesture()
                                //3. Ahora cuando termine el gesto no capturaremos nada
                                .onEnded({ _ in
                                    //4. Tomamos la animacion .easeOut, de duracion 0.2 con un retardo de un 0.1
                                    withAnimation(.easeOut(duration: 0.5).delay(0.1)){
                                        //5. Luego de esperar el delay, cambiaremos su valor
                                        self.isCardPressed.toggle()
                                        //6. En el caso de se presione la tarjeta sera la propia tarjeta, sino sera nulo
                                        self.selectedCard = self.isCardPressed ? card : nil
                                    }
                                })
                        )
                }
                .onAppear{
                    self.isCardPresented.toggle()
                }
            }
            //14. Borramos este Spacer y lo metemos mas abajo
            /*Spacer()*/
            
            //12. Entonces si la card es precionada, mostraremos las transacciones
            if isCardPressed {
                TransactionHistoryView(currentTransactions: transactions)
                //13. Le meteremos un padding y una transition move
                    .padding(16)
                    .transition(.move(edge: .bottom))
            }
            //15 Metemos aca el Spacer
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
        
        //7. Deberemos modificar este offset ya que si ahora una tarjeta es seleccinada estas deberan rotar, por lo tanto SI la tarjeta esta seleccionada
        if self.isCardPressed {
            //8. Creamos un guard para tomar el valor de la selectedCard y su indice, sino devolvemos un CGSize vacio
            guard let selectedCard = self.selectedCard,
                  let selectedIndex = self.index(for: selectedCard) else {
                return CGSize()
            }
            //9. AHora si el indice obtenido es mayor o igual a todas los indices, debolveremos un CGSize vacio
            if index >= selectedIndex {
                return CGSize()
            }
            
            //10. Ahora todas las demas que queden por encima, seran igual
            let offset = CGSize(width: 0, height: 800)
            
            //11. devolvemos el Offset
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
