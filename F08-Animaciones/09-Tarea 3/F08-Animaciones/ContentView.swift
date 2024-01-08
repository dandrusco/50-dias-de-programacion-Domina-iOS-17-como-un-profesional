//
//  ContentView.swift
//  F08-Animaciones
//
//  Created by Danilo Andrusco on 05-01-24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progress: Double = 0.0
        
    var body: some View {
        ZStack {
            Text(String(format: "%.0f%%", progress * 100))
                .font(.system(.title, design: .rounded))
                .bold()
            
            Circle()
                .stroke(Color(.systemGray4), lineWidth: 10)
                .frame(width: 200, height: 200)
            Circle()
                .trim(from: 0, to: CGFloat(progress))
                .stroke(.teal, lineWidth: 8)
                .frame(width: 200, height: 200)
                .rotationEffect(Angle(degrees: 270))
                .animation(.linear(duration: 0.5), value: progress)
        }
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                withAnimation {
                   progress += 0.01
                   if progress >= 1.0 {
                       timer.invalidate()
                   }
               }
           }
        }
    }
}

#Preview {
    ContentView()
}
