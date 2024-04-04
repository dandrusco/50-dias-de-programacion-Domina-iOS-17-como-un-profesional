//
//  SettingsView.swift
//  F12-Formularios
//
//  Created by Danilo Andrusco on 03-04-24.
//

import SwiftUI

struct SettingsView: View {
    
    //8. Para utilizar el dismiss necesitamos una variable de entorno asociado a la accion de dismiss que llamaremos con el mismo nombre a la variable
    @Environment(\.dismiss) var dismiss
    
    private var availableOrders = [
        "Orden Alfabetio",
        "Primero los Favoritos",
        "Primero los Comprados"
    ]
    
    @State private var selectedOrder = 0
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
            //1. Le pondremos un navigationTitle para los ajustes
            .navigationTitle("Ajustes")
            //2. Pondremos una toolbar
            .toolbar{
                //3. Pondremos el primero alineado a la izquierda
                ToolbarItem(placement: .topBarLeading){
                    //4. Ahora el boton con el dismiss para cerrar la ventana
                    Button{
                        dismiss()
                    } label: {
                        //5. Y con su texto de cerrar
                        Text("Cerrar")
                    }
                }
                //6. Agregaremos una segunda ToolbarItem pero alineada a la derecha
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        dismiss()
                    } label: {
                        //7. para guardar
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
