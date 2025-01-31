//
//  ContentView.swift
//  F44-Redondeos
//
//  Created by Danilo Andrusco on 29-01-25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animated = false
    
    var body: some View {
        //1. Meteremos una VStack
        VStack {
            Button(action: {
                withAnimation {
                    self.animated.toggle()
                }
            }) {
                Text("Empezar")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            .tint(.white)
            .frame(width: 300, height: 100)
            .background {
                UnevenRoundedRectangle(cornerRadii:
                        .init(topLeading: self.animated ? 90.0 : 10.0,
                              bottomLeading: self.animated ? 10.0 : 90.0,
                              bottomTrailing: self.animated ? 10.0 : 90.0,
                              topTrailing: self.animated ? 90.0 : 10.0),
                                       style: .continuous)
                .frame(width: 300, height: 100)
                .foregroundStyle(.teal)
            }
            //2. Vamos a meter un Spacer
            Spacer()
            
            //3. Crearemos una Insignia, para ello primero crearemos una ZStack
            ZStack{
                //4. Vamos a superponer 18 UnevenRoundedRectangle, para ello lo vamos a recorrer con un forEach
                ForEach(0..<18, id: \.self) { idx in
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 16.0, bottomLeading: 8.0, bottomTrailing: 16.0, topTrailing: 8.0),
                                           style: .continuous)
                    .foregroundStyle(.teal)
                    .frame(width: 300, height: 25)
                    //8. Ahora vamos a meterle una opacidad, si esta animado tendra una opácidad del 50% y de lo contrario no
                    .opacity(self.animated ? 0.4 : 1.0)
                    //5. vamos a ir rotando cada uno en 10° hasta lograr los 180°
                    .rotationEffect(.degrees(Double(10*idx)))
                    //9. Podemos añadir una animacion para añadir un retardo de 0.03 segundos
                    .animation(.easeInOut.delay(Double(idx) * 0.03),
                               value: self.animated)
                }
            }
            //7. Vamos a crear un overlay para poner una imagen de graduacion al medio de la insignia
            .overlay {
                Image(systemName: "graduationcap.fill")
                    .foregroundStyle(.white)
                    .font(.system(size: 120))
            }
            
            //6. Metemos otro Spacer para centrar la insignia
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
