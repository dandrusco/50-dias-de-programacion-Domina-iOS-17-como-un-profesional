//
//  ContentView.swift
//  F26-Actividad
//
//  Created by Danilo Andrusco on 13-12-24.
//


import SwiftUI

struct ContentView: View {
    //8 declaramos un estado para la barra de progreso, en principo en cero
    @State var progress = 0.0
    
    var body: some View {
        //9. Dentro de la VStack llamaremos al ProgressRing pasandole el progress
        VStack {
            ProgressRing(progress: self.$progress)
                
        }
        //10. Creamos una HStack para meter 4 botones
        HStack{
            //11. Los Botones iran en un grupo
            Group{
                //12. El primero sera la 0%
                Text("0 %")
                    .font(.system(.subheadline, design: .rounded))
                    //13. Como sera un boton meteremos un .onTapGesture para que cambie el valor del progress al 0%
                    .onTapGesture {
                        self.progress = 0.0
                    }
                //14. Lo mismo para el 50%
                Text("50 %")
                    .font(.system(.subheadline, design: .rounded))
                    .onTapGesture {
                        self.progress = 0.5
                    }
                //15. Para un 100%
                Text("100 %")
                    .font(.system(.subheadline, design: .rounded))
                    .onTapGesture {
                        self.progress = 1.0
                    }
                //16. Y para un 120%
                Text("120 %")
                    .font(.system(.subheadline, design: .rounded))
                    .onTapGesture {
                        self.progress = 1.2
                    }
            }
            //17. Configuramos un padding
            .padding(12)
            //18. Le damos un color de fodo, tipo boton, redondeado y un ultimo padding de 12 puntos
            .background(Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 12.0, style: .continuous))
            .padding(12)
            
        }
        //19. A la propia HStack le metemos otro padding
        .padding()
        //20. Como podemos apreciar no hay una animacion en los anillos, nos vamos a la ProgressRing para corregirlo 
    }
}

#Preview {
    ContentView()
}

