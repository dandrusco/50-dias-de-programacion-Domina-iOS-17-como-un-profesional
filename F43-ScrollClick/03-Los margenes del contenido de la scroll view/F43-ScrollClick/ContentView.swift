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
                    //1. con scrollTransition es un modificador que nos permite monitorear las transiciones. Nos permite capturar dos variales, la del contenido y la fase.
                        .scrollTransition { content, phase in
                            //2. Al contenido le cambiaremos la opacidad en funcion de la fase
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.25)
                                //3. Realizaremos lo mismo para el factor de escala
                                .scaleEffect(phase.isIdentity ? 1.0 : 0.25)
                                
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
