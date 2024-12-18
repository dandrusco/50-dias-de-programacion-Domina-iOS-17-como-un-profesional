//
//  CirclesView.swift
//  F28_MasAnimaciones
//
//  Created by Danilo Andrusco on 18-12-24.
//


import SwiftUI

struct CirclesView: View {
    
    //2. Creamos una variable de estado llamada swap de tipo boleana
    @State private var swap = false
    //3. Creamos la variable de @Namespace
    @Namespace private var circleTransition
    
    
    var body: some View {
        
        //4. Si el swap es verdadero
        if self.swap{
            //5. Después del intercambio, el morado irá a arriba, y el naranja irá a abajo
            //6. Metemos una VStack
            VStack{
                //7. Creamos un circulo morado con el matchedGeometryEffect
                Circle()
                    .fill(.purple)
                    .frame(width: 80, height: 80)
                    .matchedGeometryEffect(id: "purpleCircle", in: self.circleTransition)
                //8. Metemos un spacer
                Spacer()
                //9. Creamos el circulo naranjo
                Circle()
                    .fill(.orange)
                    .frame(width: 80, height: 80)
                    .matchedGeometryEffect(id: "orangeCircle", in: self.circleTransition)

            }
            //10. Creamos el frame
            .frame(width: 300)
            //11. Cambiamos de false a true al ser tocado
            .onTapGesture {
                withAnimation {
                    self.swap.toggle()
                }
            }
            
        }
        //12. EN caso contrario
        else {
            //13. Antes del intercambio, el naranjá irá arriba, y el morado abajo
            //14. Creamos lo mismo cambiandole su posicion 
            VStack{
                
                Circle()
                    .fill(.orange)
                    .frame(width: 80, height: 80)
                    .matchedGeometryEffect(id: "orangeCircle", in: self.circleTransition)
                
                Spacer()
                
                Circle()
                    .fill(.purple)
                    .frame(width: 80, height: 80)
                    .matchedGeometryEffect(id: "purpleCircle", in: self.circleTransition)
                
                

            }
            .frame(width: 300)
            .onTapGesture {
                withAnimation {
                    self.swap.toggle()
                }
            }
        }
    
    }
}

#Preview {
    CirclesView()
}
