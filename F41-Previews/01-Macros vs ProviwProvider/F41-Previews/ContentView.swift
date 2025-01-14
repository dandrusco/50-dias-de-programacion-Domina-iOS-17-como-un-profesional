//
//  ContentView.swift
//  F41-Previews
//
//  Created by Danilo Andrusco on 14-01-25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

//1. Si se percatan la Preview parte con un signo gato, esto se debe ya que es una macro
#Preview {
    ContentView()
}

//2. Anteriormente la preview se programaba así
struct ContentViewOld: PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}
