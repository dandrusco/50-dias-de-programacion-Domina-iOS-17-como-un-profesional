//
//  ContentView.swift
//  F18-AppleWallet
//
//  Created by Danilo Andrusco on 12-11-24.
//

import SwiftUI

struct walletView: View {
    
    private static let cardOffset: CGFloat = 40.0
    //7. Programaremos el tiempo de retardo entre las tarjetas
    private static let cardTimingOffset: CGFloat = 0.4
    
    //1. Vamos a crear una animacion a nuestras tarjetas, primero crearemos una variable de estado para ver si estan cargadas las tarjetas, en principi false
    @State private var isCardPresented = false
    
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
                        //10. Junto antes de la transision crearemos un identificador como isCardPresented
                        .id(isCardPresented)
                        //2. Añadiremos  una transision de tipo AnyTransition con desplazamiento orizontal, convinada con mover el vertice de la izquierda combinada con una opacidad
                        .transition(AnyTransition.slide.combined(with: .move(edge: .leading)).combined(with: .opacity))
                        //3. Añadimos la animacion con el metodo transtitionAnimation que crearemos a continiacion para una tarjeta asociado a la variable isCardPresented
                        .animation(self.transtitionAnimation(for: card), value: isCardPresented)
                }
                //11. Por lo tanto ahora cuando aparezca la ZStack el valor de isCardPresented pasara a ser true y esto lo hacemos con el metodo onAppear
                .onAppear{
                    //12. Con Toggle cambiamos de false a true
                    self.isCardPresented.toggle()
                }
                
            }
            Spacer()
        }
        .padding()
    }
    private func zIndex(for card: Card) -> Double {
        guard let index = index(for: card) else {
            return 0
        }
        return -Double(index)
    }
    private func offset(for card: Card) -> CGSize {
        guard let index = index(for: card) else {
            return CGSize()
        }
        return CGSize(width: 0, height: -walletView.cardOffset*CGFloat(index))
        
    }
    private func index(for card: Card) -> Int? {
        guard let index = cards.firstIndex(where: {$0.id == card.id}) else {
            return nil
        }
        return index
    }
    
    //4. Crearemos la funcion transtitionAnimation que se encargue de calcular la animacion
    private func transtitionAnimation(for card: Card) -> Animation{
        //5. Creamos un delay
        var delay = 0.0
        //6. Tomaremos el valor de la tarjeta
        if let index = index(for: card){
            //8. El delay comenzara de la que esta mas arriba hasta la mas abajo
            delay = Double(cards.count - index) * walletView.cardTimingOffset
        }
        //9. devolvemos una animacion de spring para cada tarjeta pero con un delay distinto
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
