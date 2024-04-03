//
//  SettingsView.swift
//  F12-Formularios
//
//  Created by Danilo Andrusco on 03-04-24.
//

import SwiftUI

struct SettingsView: View {
    
    private var availableOrders = [
        "Orden Alfabetio",
        "Primero los Favoritos",
        "Primero los Comprados"
    ]
    
    @State private var selectedOrder = 0
    //1. Vamos a implementar un interrupctor (On - Off para mostrar o no los cursos comprados
    //2. para ello deberemos crear una variable de estado en principio falsa
    @State private var showPurchasedOnly = false
    
    var body: some View {
        NavigationStack {
            Form{
                Section(header:Text("Orden de los cursos")){
                    Picker(selection: $selectedOrder, label:
                        Text("Orden:")){
                        ForEach(0 ..< availableOrders.count, id: \.self){
                            Text(availableOrders[$0])
                        }
                    }
                }
                Section(header:Text("Filtrar los cursos")){
                    //3. Eliminamos este texto:
                    /*Text("Filtros")*/
                    
                    //4. Ahora llamaremos a un Toggle que en isOn sera de la variable de estado anteponiendo el $
                    Toggle(isOn: $showPurchasedOnly){
                        //5. AHora pondremos un texto
                        Text("Ver solo cursos comprados")
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
