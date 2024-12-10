//
//  ContentView.swift
//  F23-Carrusel
//
//  Created by Danilo Andrusco on 08-12-24.
//

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
                                //11. mandaremos la imagen hacia arriba dependiendo del isCardSelected a sido seleccionada
                                .offset(y: self.isCardSelected ? -innerView.size.height*0.25 : 0)
                                //8. AHora solo falta invocar cuando es tocado, para ello utilizamos el onTapGesture
                                .onTapGesture {
                                    //9. con una animacion metemos una interpolatingSpring con una velocidad de 0.2
                                    withAnimation(.interpolatingSpring(.bouncy, initialVelocity: 0.2)){
                                        //10. Por lo tanto si alguien la toca, isCardSelected pasara a verdadero
                                        self.isCardSelected = true
                                    }
                                }
                        }
                        .frame(width: outerView.size.width, height: self.currentIndex == idx ? (self.isCardSelected ? outerView.size.height : 400) : 250)
                        .opacity(self.currentIndex == idx ? 1.0 : 0.65)
                        .padding(.horizontal, self.isCardSelected ? 0 : self.padding)
                    }
                }
                .frame(width: outerView.size.width, height: outerView.size.height, alignment: .leading)
                    //12. Al agrandar el detalle vemos que la imagen no se posiciona del todo bien, para ello corrigiremos el ofset quedando asi:
                    .offset(x: (self.isCardSelected ? 0 : -self.padding) - CGFloat(self.currentIndex)*(outerView.size.width+(self.isCardSelected ? 0 : self.padding*2)))
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
            
            //1. Vamos programar si la tarjeta ha sido seleccionada
            if self.isCardSelected{
                //2. Le psasmos la vista del detalle, pasandole el titulo sacandolo del arrays de curso tomando el indice seleccionado
                DetailView(title: courses[self.currentIndex].title)
                    //3. Configuramos para que la tarjeta aparezca desde abajo
                    .offset(y:200)
                    .transition(.move(edge:.bottom))
                
                //4. Creamos el boton para cerrar la tarjeta
                Button {
                    //5. Con una animacion cambiamos el valor de isCardSelected a falso
                    withAnimation {
                        self.isCardSelected = false
                    }
                } label: {
                    //6. Pintamos la imagen y la configuramos
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                        .opacity(0.7)
                        .contentShape(Rectangle())
                }
                //7. Como es costumbre configuramos el frame para poner la X del boton arriba a la derecha
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                .padding(.trailing)

            }
        }
    }
}

#Preview {
    ContentView()
}
