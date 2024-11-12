//
//  BasicSheet.swift
//  F16-BottomSheet
//
//  Created by Danilo Andrusco on 28-05-24.
//

import SwiftUI

struct BasicSheet: View {
    
    //8. Crearemos una variable de estado boobleana
    @State private var showSheed = false
    
    var body: some View {
        //7. Crearemos un boton
        Button("Mostrar Botton Sheet"){
            //9. AL precionar el boton este cambiara de false a true y viceversa
            self.showSheed.toggle()
        }
        //10. Le pondremos un estilo al boton
        .buttonStyle(.bordered)
        //11. AHora le añadiremos el modificador sheet asociado a la variable showSheed
        .sheet(isPresented: self.$showSheed, content: {
            //12. Aqui va lo que se mostrara por pantalla
            Text("Esto es un texto en la expandable bottom sheet.")
            //13. Pondremos un presentationDetents con la opcion de medio y largo, para que ocupe la pantalla hasta la mitad 
                .presentationDetents([.medium, .large])
        })
        //14. ENviaremos el boton arriba del todo
        Spacer()
    }
}

#Preview {
    BasicSheet()
}
