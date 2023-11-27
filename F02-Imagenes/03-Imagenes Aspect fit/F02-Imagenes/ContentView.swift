//
//  ContentView.swift
//  F02-Imagenes
//
//  Created by Danilo Andrusco on 27-11-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("Bruno")
            .resizable()
            .ignoresSafeArea(.container, edges: .bottom)
        //1. Para mantener el aspecto original
            .scaledToFit()
    }
}

#Preview {
    ContentView()
}
