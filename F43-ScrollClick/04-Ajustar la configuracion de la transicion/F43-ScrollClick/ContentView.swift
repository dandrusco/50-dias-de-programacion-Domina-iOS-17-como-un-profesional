//
//  ContentView.swift
//  F43-ScrollClick
//
//  Created by Danilo Andrusco on 29-01-25.
//

import SwiftUI

struct ContentView: View {
    
    let colors: [Color] = [.indigo, .teal, .mint, .purple, .orange, .yellow]
    
    @State private var scrollID: Int?
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 16){
                ForEach(0...100, id: \.self) { idx in
                    self.colors[idx % self.colors.count]
                        .frame(height: 300)
                        .overlay {
                            Text("\(idx)")
                                .font(.system(size: 80, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                        }
                        //1. Ademas de la configuracion por defecto del scrollTransition, le podemos agregar una animacion (animated) con .threshold(.visible(0.4)) podemos configurar la vista para que no arranque la caja 2 difuminada, por lo tanto la animacion partira cuando tenga mas de un 40% visible
                        .scrollTransition(.animated.threshold(.visible(0.4))) { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.25)
                                .scaleEffect(phase.isIdentity ? 1.0 : 0.25)
                                //2. Para darle un mejor efecto, podemos rotarla, en cada uno de los ejes (1, 1, 1)
                                .rotation3DEffect(.radians(phase.value*3.14), axis: (1, 1, 1))
                        }
                        .onTapGesture {
                            withAnimation {
                                self.scrollID = 0
                            }
                        }
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(.horizontal, 16.0, for: .scrollContent)
        .scrollPosition(id: self.$scrollID)
        .onChange(of: self.scrollID) { oldValue, newValue in
            print(newValue ?? "")
        }
    }
}

#Preview {
    ContentView()
}
