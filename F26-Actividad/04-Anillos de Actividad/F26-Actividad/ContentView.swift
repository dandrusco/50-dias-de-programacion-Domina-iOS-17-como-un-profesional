//
//  ContentView.swift
//  F26-Actividad
//
//  Created by Danilo Andrusco on 13-12-24.
//

//1. Como tarea deberemos implementar los 3 aniños
import SwiftUI

struct ContentView: View {
    
    @State var progress = 0.0
    
    var body: some View {
        VStack {
            //2. meteremos los 3 aniños en una ZStack
            ZStack{
                //3. acada aniño le iremos subiendo 60 puntos el width par aque quede uno arriba del otro y cada anillo tendra un color disitnto
                ProgressRing(thickness: 25,
                             width: 190,
                             color: .darkBlue,
                             gradient: Gradient(colors: [.darkBlue, .lightBlue]),
                             progress: self.$progress)
                
                ProgressRing(thickness: 25,
                             width: 250,
                             color: .darkGreen,
                             gradient: Gradient(colors: [.darkGreen, .lightGreen]),
                             progress: self.$progress)
                
                ProgressRing(thickness: 25,
                             width: 310,
                             color: .darkRed,
                             gradient: Gradient(colors: [.darkRed, .lightRed]),
                             progress: self.$progress)
            }
                
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

