//
//  ContentView.swift
//  F05-Botones
//
//  Created by Danilo Andrusco on 05-12-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                print("Hemos pulsado el boton")
            }, label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
            })
            .buttonStyle(RotationStyle())
        }
    }
}

struct RotationStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.black)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color("PrimerColor"), Color("SegundoColor")]), startPoint: .top, endPoint: .trailing))
            .cornerRadius(40)
            .shadow(color: .gray, radius: 20)
            .padding(.horizontal, 10)
            .rotationEffect(configuration.isPressed ? Angle(degrees: 45) : Angle(degrees: 0))
    }
}

#Preview {
    ContentView()
}
