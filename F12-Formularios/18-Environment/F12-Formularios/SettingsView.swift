//
//  SettingsView.swift
//  F12-Formularios
//
//  Created by Danilo Andrusco on 03-04-24.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedOrder = DisplayOrder.alphabetical
    @State private var showPurchasedOnly = false
    @State private var showFavoriteOnly = false
    @State private var maxDifficulty = 4
    @State private var minPrice: Float = 0.0
    @State private var maxPrice: Float = 50.0
    
    //6. Ahora la variable settings debera ser declarada como un  EnviromentObject para poder compartir los datos entre vistas
    @EnvironmentObject var settings: SettingsFactory
    
    var body: some View {
        NavigationStack {
            Form{
                Section(header:Text("Orden de los cursos")){
                    Picker(selection: $selectedOrder, label:
                        Text("Orden:")){
                        ForEach(DisplayOrder.allCases, id: \.self){
                            order in
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
                        Slider(value: $minPrice, in: 0...50, step: 1){

                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("50")
                        }
                        Slider(value: $maxPrice, in: 0...50, step: 1){

                        } minimumValueLabel: {
                            Text("0")
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
                        self.settings.showfavorite = self.showFavoriteOnly
                        self.settings.showPurchasedOnly = self.showPurchasedOnly
                        self.settings.displayOrder = self.selectedOrder.rawValue
                        self.settings.maxDifficultyLevel = self.maxDifficulty

                        if self.minPrice > self.maxPrice{
                            let aux = self.minPrice
                            self.minPrice = self.maxPrice
                            self.maxPrice = aux
                        }
                        
                        self.settings.minPriceShow = self.minPrice
                        self.settings.maxPriceShow = self.maxPrice
                        
                        dismiss()
                    } label: {
                        Text("Guardar")
                    }
                }
            }
        }
        .onAppear{
            self.showFavoriteOnly = self.settings.showfavorite
            self.showPurchasedOnly = self.settings.showPurchasedOnly
            self.selectedOrder = DisplayOrder(type: self.settings.displayOrder)
            self.maxDifficulty = self.settings.maxDifficultyLevel
            self.minPrice = self.settings.minPriceShow
            self.maxPrice = self.settings.maxPriceShow
            
            if(self.maxPrice <= minPrice){
                self.maxPrice = 50.0
                self.minPrice = 0
            }
        }
    }
}

#Preview {
    //7. Deberemos modificar la review ya que las ssettings no tienen que ser asignadas como tal, sino que debe ser invocada con environmentObject
    SettingsView().environmentObject(SettingsFactory())
    //8. AHora nos iremos a arreglar lo roto en la ContentView
}
