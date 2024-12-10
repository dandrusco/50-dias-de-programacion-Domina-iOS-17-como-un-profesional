//
//  ContentView.swift
//  F23-Carrusel
//
//  Created by Danilo Andrusco on 08-12-24.
//

//1. Vamos a crear un nuevo archivo llamado DetailView de tipo SwiftUI que lo guardaremos en la carpeta de View
import SwiftUI

struct ContentView: View {

    @State private var isCardSelected = false

    @State private var currentIndex = 5

    private var padding: CGFloat = 16

    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, content: {
                Text("Descubre nuevos cursos")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                
                Text("Explora los cursos de Frogames Formación")
                    .font(.system(.subheadline, design: .rounded))
            })
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding(.top, 24)
                .padding(.leading, 16)
                .opacity(self.isCardSelected ? 0.1 : 1.0)
                .offset(y : self.isCardSelected ? -150 : 0)
            GeometryReader { outerView in
                HStack(spacing:0){
                    ForEach(courses.indices, id: \.self) { idx in
                        GeometryReader { innerView in
                            CardView(title: courses[idx].title, imageName: courses[idx].image, showDetails: self.$isCardSelected)
                        }
                        .frame(width: outerView.size.width, height: self.currentIndex == idx ? (self.isCardSelected ? outerView.size.height : 400) : 250)
                        .opacity(self.currentIndex == idx ? 1.0 : 0.65)
                        .padding(.horizontal, self.isCardSelected ? 0 : self.padding)
                    }
                }
                .frame(width: outerView.size.width, height: outerView.size.height, alignment: .leading)
                    .offset(x: -self.padding - CGFloat(self.currentIndex)*(outerView.size.width+(self.isCardSelected ? 0 : self.padding*2)))
                    .offset(x:self.dragOffset)
                    .gesture(
                        !self.isCardSelected ?
                        DragGesture()
                            .updating(self.$dragOffset, body: { value, state, transaction in
                                state = value.translation.width
                            })
                            .onEnded({ value in
                                let threshold = outerView.size.width * 0.55
                                var newIndex = Int(-value.translation.width / threshold) + self.currentIndex
                                newIndex = min(max(newIndex, 0), courses.count-1)
                                self.currentIndex = newIndex
                            })
                        : nil
                        
                    )
            }
            .animation(.interpolatingSpring(.bouncy), value: self.dragOffset)
        }
    }
}

#Preview {
    ContentView()
}
