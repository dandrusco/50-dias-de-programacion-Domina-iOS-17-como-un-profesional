//
//  ContentView.swift
//  F15-Gestos
//
//  Created by Danilo Andrusco on 20-05-24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isTapped = false
    //4. Para llevar a cabo dicha animacion deberemos implementar un Gestor de estados
    @GestureState private var longPress = false
    
    var body: some View {
        Image(systemName: "book.circle.fill")
            .font(.system(size: 200))
            .foregroundStyle(.teal)
            //7. Entonces cuando se presione el icono, la variable longPress pasara a ser True, por lo tanto le cambiaremos su opacidad
            .opacity(self.longPress ? 0.5 : 1.0)
            .scaleEffect(self.isTapped ? 0.5 : 1.0)
            .animation(.bouncy, value: self.isTapped)
            .gesture(
                //1. En vez de utilizar el TapGesture lo cambiaremos por el LongPressGesture indicandole la duracion minima del gesto, en nuestro caso de 1 segundo
                /*TapGesture()*/
                LongPressGesture (minimumDuration: 1.0)
                    //5. Meteremos otro metoro llamado updating, donde le pasaremos la variable del GestureState. En el body deberemos pasarle un tupla con 3 elementos (la que tenemos almacenada, el estado actual y la transaccion)
                    .updating(self.$longPress, body: {
                        (currentState, state, transaction) in
                        //6. Aqui le pasamos al state, el estado en el que nos encontramos por si este acaba de ser modificado
                        state = currentState
                    })
                    //2. Ademas si no vamos a utlizar la duracion le pondremos barra baja in
                    .onEnded({ _ in
                        //3. SI probamos, tendremos que mantener pulsado por un segundo para que el icono se achique, esto para el usuario podreia hacer que creyera que la aplicacion en si no responde, para ello podriamos crear que al momento justo de precionarlo, el icono se volviera algo transparente para que el usuario sepa que esta por hacer un efecto
                        self.isTapped.toggle()
                    })
            )
        
    }
}

#Preview {
    ContentView()
}
