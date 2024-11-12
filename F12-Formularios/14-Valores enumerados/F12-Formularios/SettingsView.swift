//
//  SettingsView.swift
//  F12-Formularios
//
//  Created by Danilo Andrusco on 03-04-24.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    //16. Como comprenderan esta variable ya no nos servira
    /*private var availableOrders = [
        "Orden Alfabetio",
        "Primero los Favoritos",
        "Primero los Comprados"
    ]*/
    
    //17 . Vemos que el selectedOrder es igual a cero, pued bien, utilizaremos nuestro enumerado, por lo tanto cambiaremos el 0 por DisplayOrder.alphabetical
    @State private var selectedOrder = DisplayOrder.alphabetical
    @State private var showPurchasedOnly = false
    @State private var showFavoriteOnly = false
    @State private var maxDifficulty = 4
    @State private var minPrice = 0.0
    @State private var maxPrice = 50.0
    
    var body: some View {
        NavigationStack {
            Form{
                Section(header:Text("Orden de los cursos")){
                    Picker(selection: $selectedOrder, label:
                        Text("Orden:")){
                        //18. En este ForEach, quitaremos el (0 ..< availableOrders.count) por DisplayOrder.allCases el cual devolvera una coleccion con todos los enumerados posibles
                        ForEach(DisplayOrder.allCases, id: \.self){
                            //19. Ahora recuperaremos este order
                            order in
                            //20. Y el availableOrders[$0] sera remplazado por order (.) y la propiedad del texto, para mostrar la variable asociada al selectedOrder
                            Text(order.text)
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
                    DisclosureGroup("Rango de precio"){
                        Text("Curso entre USD \(Int(minPrice)) y \(Int(maxPrice))")
                        Slider(value: $minPrice, in: 0...(maxPrice-1), step: 1){

                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("\(Int(maxPrice))")
                        }
                    
                        Slider(value: $maxPrice, in: (minPrice)...50, step: 1){

                        } minimumValueLabel: {
                            Text("\(Int(minPrice))")
                        } maximumValueLabel: {
                            Text("50")
                        }
                    }
                }
            }
            .navigationTitle("Ajustes")
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        dismiss()
                    } label: {
                        Text("Cerrar")
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        dismiss()
                    } label: {
                        Text("Guardar")
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
