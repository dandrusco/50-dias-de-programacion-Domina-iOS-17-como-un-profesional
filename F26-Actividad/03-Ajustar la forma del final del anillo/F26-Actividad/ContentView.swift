//
//  ContentView.swift
//  F26-Actividad
//
//  Created by Danilo Andrusco on 13-12-24.
//


import SwiftUI

struct ContentView: View {
    
    @State var progress = 0.0
    
    var body: some View {
        VStack {
            ProgressRing(progress: self.$progress)
                
        }
        HStack{
            Group{
                Text("0 %")
                    .font(.system(.subheadline, design: .rounded))
                    .onTapGesture {
                        self.progress = 0.0
                    }
                Text("50 %")
                    .font(.system(.subheadline, design: .rounded))
                    .onTapGesture {
                        self.progress = 0.5
                    }
                Text("100 %")
                    .font(.system(.subheadline, design: .rounded))
                    .onTapGesture {
                        self.progress = 1.0
                    }
                Text("120 %")
                    .font(.system(.subheadline, design: .rounded))
                    .onTapGesture {
                        self.progress = 1.2
                    }
            }
            .padding(12)
            .background(Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 12.0, style: .continuous))
            .padding(12)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

