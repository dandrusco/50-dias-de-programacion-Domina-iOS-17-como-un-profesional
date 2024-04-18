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
    //3. PAra evitar error tanto el minPice como el maxPrice le diremos que son float
    @State private var minPrice: Float = 0.0
    @State private var maxPrice: Float = 50.0
    
    var settings: SettingsFactory
    
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
                        //16. Arreglaremos el maximo
                        Slider(value: $minPrice, in: 0...50, step: 1){

                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            //17. Cambiaremos el texto
                            Text("50")
                        }
                        //15. Corregiremos otro fallo al llegar al minumo
                        Slider(value: $maxPrice, in: 0...50, step: 1){

                        } minimumValueLabel: {
                            //18. Lo mismo aqui pero en 0
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
                        //1. La logica del boton de guardar vamos a tener que proceder a guardar los 6 valores
                        self.settings.showfavorite = self.showFavoriteOnly
                        self.settings.showPurchasedOnly = self.showPurchasedOnly
                        //2. El displayOrder es de tipo entero pero comoguardaremos la clave deberemos guardar el valor en curdo
                        self.settings.displayOrder = self.selectedOrder.rawValue
                        self.settings.maxDifficultyLevel = self.maxDifficulty
                        //19. Ahora como el mas maximo podria ser mas pequeño que el minumo, lo arreglaremos con una sentencia if dandolos vuelta
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
        //4. En la navigationStack meteremos un onAppear para cambiar los 6 estados con los datos de la BBDD
        .onAppear{
            self.showFavoriteOnly = self.settings.showfavorite
            self.showPurchasedOnly = self.settings.showPurchasedOnly
            //5. Deberemos llamar al constructor
            self.selectedOrder = DisplayOrder(type: self.settings.displayOrder)
            self.maxDifficulty = self.settings.maxDifficultyLevel
            self.minPrice = self.settings.minPriceShow
            self.maxPrice = self.settings.maxPriceShow
            //6. Nos iremos a la ContentView para corregir el error del video anterior
            
            //14. Como podemos apreciar nos da un error en el maxPrince, para solucionarlo lo tendremos que arreglar en un IF reiniciando sus valores por si algo sale mal
            if(self.maxPrice <= minPrice){
                self.maxPrice = 50.0
                self.minPrice = 0
            }
        }
    }
}

#Preview {
    SettingsView(settings: SettingsFactory())
}
