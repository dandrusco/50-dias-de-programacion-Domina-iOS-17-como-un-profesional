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
    //1. Creamos una variable de estado para los favoritos
    @State private var showFavoriteOnly = false
    
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
                    //2. Implementamos el Toggle
                    Toggle(isOn: $showFavoriteOnly){
                        Text("Ver solo cursos favoritos")
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
