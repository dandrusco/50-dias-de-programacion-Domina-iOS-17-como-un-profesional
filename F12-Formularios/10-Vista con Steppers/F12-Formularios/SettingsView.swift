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
    @State private var showPurchasedOnly = false
    @State private var showFavoriteOnly = false
    //1. Vamos a implementar un Stepper para seleccinar el nuvel de dificultad d elos cursos, para ello nuevamente necesitaremos de un Stado
    @State private var maxDifficulty = 4
    
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
                    Toggle(isOn: $showPurchasedOnly){
                        Text("Ver solo cursos comprados")
                    }
                    Toggle(isOn: $showFavoriteOnly){
                        Text("Ver solo cursos favoritos")
                    }
                    //2. Implementamos el Stepper
                    Stepper  {
                        //3. En el OnIncrement:
                        maxDifficulty += 1
                        //4. Con una salvedad que si maxDififculty subrepasa el 4, siempre sera 4 ya que no tenemos mas dificultad
                        if maxDifficulty > 4 {
                            maxDifficulty = 4
                        }
                    } onDecrement: {
                        //5. En el decrement tendra la misma logica que el anterior:
                        maxDifficulty -= 1
                        if maxDifficulty < 1 {
                        maxDifficulty = 1
                        }
                    } label: {
                        //6. Ahora nos queda la etiqueta
                        Text("Dificultad \(Image(systemName: "cellularbars", variableValue: Double(maxDifficulty)/4))")
                    }

                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
