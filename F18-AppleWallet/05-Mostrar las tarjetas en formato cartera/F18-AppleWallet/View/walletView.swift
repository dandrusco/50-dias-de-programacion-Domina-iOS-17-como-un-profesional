//
//  ContentView.swift
//  F18-AppleWallet
//
//  Created by Danilo Andrusco on 12-11-24.
//

import SwiftUI

struct walletView: View {
    
    //11. Creamos una constante para mover las tarjetas unos 40 puntos de una de las otras
    private static let cardOffset: CGFloat = 40.0
    
    var body: some View {
        VStack {
            TopBar()
            //1. meteremos un Spacer para lanzar la barra hacia arriba
            Spacer()
            //2. Meteremos una ZStack para ir recuperando las tarjetas
            ZStack{
                ForEach(cards){ card in
                    CardView(card: card)
                        .padding(.horizontal, 24)
                        //14. Añadiremos el offset
                        .offset(self.offset(for: card))
                        //10. Ahora lo invocamos para invertir las tarjetas
                        .zIndex(self.zIndex(for: card))
                }
            }
            //3. Metemos un Spacer para que nos quede al medio
            Spacer()
        }
        .padding()
    }
    //4. El primer problema que detectamos es que la ultima tarjeta ahora se muestra de las primeras y lo otro que todas las tarjetas tienen la misma posision por lo cual no se aprecia si hay mas tarjetas
    //5. Para ello programaremos su index a partir de una tarjeta, que nops devolvera un valor de tipo doble que sera el indice exacto de las tarjetas
    private func zIndex(for card: Card) -> Double {
        //6. Para evitar errores programare un guard
        guard let index = index(for: card) else {
            return 0
        }
        //7. de volverems el opuesto de su index
        return -Double(index)
    }
    
    //12. Crearemos una funcion para desplazarlas
    private func offset(for card: Card) -> CGSize {
        guard let index = index(for: card) else {
            return CGSize()
        }
        //13. Si recuperamos el indice, nos deplazamos los 40 puntos y lo multiplicamos con el index, al ser statica la cardOffet deberemos llamar a la misma clase walletView
        return CGSize(width: 0, height: -walletView.cardOffset*CGFloat(index))
        
    }
    
    //8. Crearemos otra funcion para que nos devulva el index pero en forormato entero opcional
    private func index(for card: Card) -> Int? {
        //9. Ultilizaremos el guard para evitar errores
        guard let index = cards.firstIndex(where: {$0.id == card.id}) else {
            return nil
        }
        return index
    }
    //9. Basicamente la funcion index busca la posicion y la Zindex calcula el opuesto
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
