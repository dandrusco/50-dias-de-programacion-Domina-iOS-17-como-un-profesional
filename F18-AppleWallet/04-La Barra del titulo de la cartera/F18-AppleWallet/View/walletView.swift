//
//  ContentView.swift
//  F18-AppleWallet
//
//  Created by Danilo Andrusco on 12-11-24.
//

import SwiftUI

//1. Cambiaremos el nombre a esta estructura a WalletView
struct walletView: View {
    var body: some View {
        VStack {
            //3. llamaremos a la TopBar
            TopBar()
        }
        .padding()
    }
}

//2. Programaremos la barra de tirulo y la de añadir tarjetas
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
