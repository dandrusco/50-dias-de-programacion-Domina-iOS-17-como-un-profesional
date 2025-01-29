//
//  ContentView.swift
//  F43-ScrollClick
//
//  Created by Danilo Andrusco on 29-01-25.
//

import SwiftUI

struct ContentView: View {
    
    //1. Partiremos creando un Arrays de colores
    let colors: [Color] = [.indigo, .teal, .mint, .purple, .orange, .yellow]
    
    //9. Para identificar el ID del scroll crearemos una variable de estado
    @State private var scrollID: Int?
    
    var body: some View {
        //2. Creamos una ScrollView
        ScrollView{
            //3. Creamos una LazyVStack con un espaciado de 16 puntos
            LazyVStack(spacing: 16){
                //4. Creamos un forEach desde el 0 al 100.
                ForEach(0...100, id: \.self) { idx in
                    //5. Vamos a crear los colores a partir de la posicion idx
                    self.colors[idx % self.colors.count]
                        //6. para que4 se vea mas grande le metemos un frame de 300
                        .frame(height: 300)
                        //7. Para identificarlo le pondremos el numero a cada cuadrado
                        .overlay {
                            Text("\(idx)")
                                .font(.system(size: 80, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                        }
                        //14. Creamos un onTapGesture que contendra una anumacion
                        .onTapGesture {
                            withAnimation {
                                //15. Cuando se toque un numero, este se ira al cero
                                self.scrollID = 0
                            }
                        }
                }
            }
            //11 scrollPosition necesita si o si el scrollTargetLayout para calcular correctamente
            .scrollTargetLayout()
        }
        //8. Meteremos un contentMargins con 16 puntos en horizontal para darle un respiro a la pantalla, para el scrollContent
        .contentMargins(.horizontal, 16.0, for: .scrollContent)
        //10. A la propia scrollPosition le pasamos la variable de estado $scrollID, a medida que movemos el Scrol, el scrollID se ira actualizando
        .scrollPosition(id: self.$scrollID)
        //12. Para observar cambios en la posicion necesitamos un onChange, cuando cambie la variable scrollID, obtendremos el valor antiguo y el nuevo
        .onChange(of: self.scrollID) { oldValue, newValue in
            //13. Imprimiremos el nuevo valor cmo opcional
            print(newValue ?? "")
        }
    }
}

#Preview {
    ContentView()
}
