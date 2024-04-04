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
    @State private var maxDifficulty = 4
    //1. Crearemos dos estados para filtrar por precio minimo o maximo
    @State private var minPrice = 0.0
    @State private var maxPrice = 50.0
    
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
                    Stepper  {
                        maxDifficulty += 1
                        if maxDifficulty > 4 {
                            maxDifficulty = 4
                        }
                    } onDecrement: {
                        maxDifficulty -= 1
                        if maxDifficulty < 1 {
                        maxDifficulty = 1
                        }
                    } label: {
                        Text("Dificultad \(Image(systemName: "cellularbars", variableValue: Double(maxDifficulty)/4))")
                    }
                    //2. Ultilizaremos dos eslider para minimo y maximo, para ello los agruparemos con desclosureGropu
                    DisclosureGroup("Rango de precio"){
                        Text("Curso entre USD \(Int(minPrice)) y \(Int(maxPrice))")
                        //3. Colocaremos 2 Slider donde el valor sera el minPrice para el primero de los Slider, cuyo valor ira entre 0 a y el precio maximo -1 y que suba en 1 en 1
                        Slider(value: $minPrice, in: 0...(maxPrice-1), step: 1){
                            //4. Como etiqueta no pondremos nada, pero si estableceremos el minimumValueLabel y el maximumValueLabel
                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("\(Int(maxPrice))")
                        }
                        //5. Configuraremos el segundo Slider para el precio maximo
                        Slider(value: $maxPrice, in: (minPrice)...50, step: 1){
                            //4. Como etiqueta no pondremos nada, pero si estableceremos el minimumValueLabel y el maximumValueLabel
                        } minimumValueLabel: {
                            Text("\(Int(minPrice))")
                        } maximumValueLabel: {
                            Text("50")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
