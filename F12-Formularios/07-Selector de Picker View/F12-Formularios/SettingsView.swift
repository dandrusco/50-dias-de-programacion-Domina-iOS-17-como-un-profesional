//
//  SettingsView.swift
//  F12-Formularios
//
//  Created by Danilo Andrusco on 03-04-24.
//

import SwiftUI

struct SettingsView: View {
    
    //1. Vamos a crear un Array para el tipo de orden
    private var availableOrders = [
        "Orden Alfabetio",
        "Primero los Favoritos",
        "Primero los Comprados"
    ]
    
    //2. Deberemos crear una variable de estado para almacenar la seleccion del usuario, por ejemplo "Orden alfabetio" sera el tipo 0, el que sigue el 1 y asi sucesivamente, por defecto estara en cero
    @State private var selectedOrder = 0
    
    var body: some View {
        NavigationStack {
            Form{
                Section(header:Text("Orden de los cursos")){
                    //3. Ahora ya podemos borrar este texto
                    /*Text("Mostrar orden")*/
                    
                    //4. Ahora crearemos una PickerView, donde la variable selection guardara la opcion seleccionada (0, 1, 2...), deberemos anteponer el signo dolar ya que es un estado, y en la label pondremos un texto a mostrar
                    Picker(selection: $selectedOrder, label:
                        Text("Orden:")){
                        //5. Como las diferentes opciones las metimos dentro de un array tendremos que recorrerla con un forEach, desde la posicion 0, hasta la posicion anterior del la variable availableOrders. Y su identificacion sera referido a si mismo (.self)
                        ForEach(0 ..< availableOrders.count, id: \.self){
                            //6. Mostraremos un texto donde aparezca availableOrders que se encuentra en la posicion del indice actual ($0)
                            Text(availableOrders[$0])
                        }
                    }
                }
                Section(header:Text("Filtrar los cursos")){
                    Text("Filtros")
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
