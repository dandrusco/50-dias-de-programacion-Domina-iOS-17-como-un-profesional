//
//  ContentView.swift
//  F28_MasAnimaciones
//
//  Created by Danilo Andrusco on 18-12-24.
//

import SwiftUI

struct ContentView: View {
    //1. Creamos una variable de expancion que por defecto sera falsa
    @State private var expanded = false
    
    //2. Para crear una animacion necesitamos crear una variable de @Namespace
    @Namespace private var circleTransition
    
    var body: some View {
        
        //3. Programaremos el caso de que este expandida
        if self.expanded {
            //4. Caso Final, cuando precionamos el rectangulo lo transformaremos en un circulo
            RoundedRectangle(cornerRadius: 75)
                .fill(.teal)
                //5. En el matchedGeometryEffect debemos darle un identificador unico,  en nuestro caso lo llamaremos circle, y lo asociaremos al circleTransition
                .matchedGeometryEffect(id: "circle", in: self.circleTransition)
                .padding()
                .frame(width: 150, height: 150)
                //6. cada ves que se precione amadiremos una animacion donde la cambiaremos el valor a expanded
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.expanded.toggle()
                    }
                }
            //7. Añadimos el Spacer para lanzarlo hacia arriba
            Spacer()
            
        }
        //8. Caso No expandido, creamos lo mismo pero con otros valores
        else {
            //9. EL Spacer lo tirara hacia abajo
            Spacer()
            //10. Caso Inicial, cuando arranca la App
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(.purple)
                .matchedGeometryEffect(id: "circle", in: self.circleTransition)
                .padding(32)
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 250)
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.expanded.toggle()
                    }
                }
        }
        
    }
}

#Preview {
    ContentView()
}

//11. Crearmos otra ahora que aparezca incialmente un cirulo, y al precionarlo se agrande por toda la pantalla, para ello crearemos una estructura de tipo vista
struct CircleToBackgroundView: View {
    
    //12. Cremos el @Namespace y la variable de estado
    @Namespace private var backgroundTransition
    @State private var expanded = false
    
    var body: some View {
        //14. En el caso de que este expandida
        if self.expanded{
            //15. Como esta expandido creamos el fondo de pantallaFondo de pantalla
            RoundedRectangle(cornerRadius: 20.0)
                .matchedGeometryEffect(id: "shape", in: self.backgroundTransition)
                .foregroundStyle(.purple)
                //16 Ignoramos las aeras
                .ignoresSafeArea()
                
                .onTapGesture {
                    withAnimation {
                        self.expanded.toggle()
                    }
                }
        }
        //17 En caso de que no este expandido
        else{
            //18. con un Spacer tiramos todo para abajo y creamos el Circulo
            Spacer()
            
            RoundedRectangle(cornerRadius: 50)
                .matchedGeometryEffect(id: "shape", in: self.backgroundTransition)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .foregroundStyle(.teal)
                
                .onTapGesture {
                    withAnimation {
                        self.expanded.toggle()
                    }
                }
        }
    }
}

//13. Implementamos la preview
#Preview("Circle To Background View"){
    CircleToBackgroundView()
}
