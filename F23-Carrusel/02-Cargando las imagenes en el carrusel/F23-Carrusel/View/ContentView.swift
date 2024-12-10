//
//  ContentView.swift
//  F23-Carrusel
//
//  Created by Danilo Andrusco on 08-12-24.
//

import SwiftUI

struct ContentView: View {
    //1. Creamos un estado para ver si el curso esta seleccionado
    @State private var isCardSelected = false
    //2. Creamos una variable para saer la posicion de la tarjeta visible, nos quedaremos con la que ocupa la 5 posicion
    @State private var currentIndex = 5
    //3. Vamos a establecer un Padding por defecto de 16 puntos
    private var padding: CGFloat = 16
    //4. Para saber cuanto hemos movido el carrusel crearemos un GestureState con 0 puntos
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        //5. Crearemos una HStack
        ZStack {
            //6. Creamos el titulo y un subtitulo en una VStack
            VStack(alignment: .leading, content: {
                Text("Descubre nuevos cursos")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                
                Text("Explora los cursos de Frogames Formación")
                    .font(.system(.subheadline, design: .rounded))
            })
            //7. Configuramos un frame para tirar los textos arriba a la izquierda
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding(.top, 24)
                .padding(.leading, 16)
                .opacity(self.isCardSelected ? 0.1 : 1.0)
                //8. en el caso de ser verdadero isCardSelected la desplazaremos hacia arriba para ocultarla
                .offset(y : self.isCardSelected ? -150 : 0)
            //9. Vamos obtener acceso a la geometia externa
            GeometryReader { outerView in
                //10. Metemos uns HStack con spacing:0 para que los cursos queden pegados uno con los otros
                HStack(spacing:0){
                    //11. Recorremos los cursos, obteniendo el indice
                    ForEach(courses.indices, id: \.self) { idx in
                        //12. Utilizaremos nuevamente un GeometryReader para la vista interna de cada tarjeta
                        GeometryReader { innerView in
                            //13. Generamos la tarjeta con cada detalle
                            CardView(title: courses[idx].title, imageName: courses[idx].image, showDetails: self.$isCardSelected)
                        }
                        //14. Configuramos el frame de la GeometryReader haciendola mas grande o mas pequela si esta o no seleccionada una tarjeta. Esto probacara un efecto que las que vamos deslizando se vean mas grande que las otras
                        .frame(width: outerView.size.width, height: self.currentIndex == idx ? (self.isCardSelected ? outerView.size.height : 400) : 250)
                        //15. Configuramos la opacidad dependiendo del valor del currentIndex, lo que permite es que se vean opacas al movimiento
                        .opacity(self.currentIndex == idx ? 1.0 : 0.65)
                        //16. Configuramos un padding interno toamndo el valor del isCardSelected pasando de 0 a 16
                        .padding(.horizontal, self.isCardSelected ? 0 : self.padding)
                    }
                }
                //17. Configuramos el frame de la HStack para que tenga la misma anchura y altura de la pantalla, con alignment: .leading para que muestre el primer curso
                .frame(width: outerView.size.width, height: outerView.size.height, alignment: .leading)
                    //18 Configuramos el Ofset tomando el valor inverso del pading, menos el currentIndex * la anchura del outerView + isCardSelected dependiendo de su valor
                    .offset(x: -self.padding - CGFloat(self.currentIndex)*(outerView.size.width+(self.isCardSelected ? 0 : self.padding*2)))
                    //19 Vamos a crear un segundo offset con la variable que se actualiza en tiempo real dragOffset permitiendolo deslizar suevamente
                    .offset(x:self.dragOffset)
                    //20 Programaremos el gesto, dependiendo si hemos o no seleccionado una tarjeta
                    .gesture(
                        !self.isCardSelected ?
                        //21 Si no esta selecionada generaremos un DragGesture
                        DragGesture()
                            //22 Realizaremos una actualizacion a la variable $dragOffset, recuperando del body el valor, el stado y la transicion
                            .updating(self.$dragOffset, body: { value, state, transaction in
                                //23 El state sera actualizado al valor de la translation de la anchura
                                state = value.translation.width
                            })
                            //24 En el onEnded devemos calcular el valor final de la translation
                            .onEnded({ value in
                                //25 el threshold sera igual a la mitad de la pantalla X 0.55
                                let threshold = outerView.size.width * 0.55
                                //26 Calculamos la nueva posicion, convirtiendola a entero el valor inverso de la translation.width / threshold, sumandole la posicion actual
                                var newIndex = Int(-value.translation.width / threshold) + self.currentIndex
                                //27 En caso de que nos pasemos configuramos el maximo y el minimo
                                newIndex = min(max(newIndex, 0), courses.count-1)
                                //28 Ahora solo sobreescribimos el currentIndex con el valor del nuevo indice
                                self.currentIndex = newIndex
                            })
                        //29 En el caso de que si este la tarjeta seleccionada el valor sera nulo
                        : nil
                        
                    )
            }
            //30 Creamos la anuimacion del desplazamiento de las tarjetas, tomando el valor asociado al moviemiento dragOffset
            .animation(.interpolatingSpring(.bouncy), value: self.dragOffset)
        }
    }
}

#Preview {
    ContentView()
}
