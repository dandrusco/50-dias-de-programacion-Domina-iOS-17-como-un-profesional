//
//  ContentView.swift
//  F08-Animaciones
//
//  Created by Danilo Andrusco on 05-01-24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progress: CGFloat = 0.0
        
    var body: some View {
        ZStack {
            Text("\(Int(progress*100))%")
                .font(.system(.title, design: .rounded))
                .bold()
            
            Circle()
                .stroke(Color(.systemGray4), lineWidth: 16)
                .frame(width: 200, height: 200)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(.teal, lineWidth: 8)
                .frame(width: 200, height: 200)
                .rotationEffect(Angle(degrees: -90))
        }
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true)
                { timer in
               progress += 0.02
               if progress >= 1.0 {
                   timer.invalidate()
               }
           }
        }
    }
}

#Preview {
    ContentView()
}
