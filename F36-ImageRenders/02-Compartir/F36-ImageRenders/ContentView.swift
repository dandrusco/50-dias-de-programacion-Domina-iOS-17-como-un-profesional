//
//  ContentView.swift
//  F36-ImageRenders
//
//  Created by Danilo Andrusco on 09-01-25.
//

import SwiftUI

struct ContentView: View {
   
    var chartView = ChartView()
     
     var body: some View {
         VStack (spacing: 24){
             self.chartView
             HStack{
                 Button {
                     UIImageWriteToSavedPhotosAlbum(self.generateSnapshot(), nil, nil, nil)
                 } label: {
                     Label("Guardar en Fotos", systemImage: "photo")
                 }
                 .buttonStyle(.borderedProminent)
                 .tint(.teal)
                 
                 //01. Crearemos primero el de compartir antes del guardar en PDF ya que este lo vimos en videos anteriores, esta tambien generara la imagen apartir de la funcion generateSnapshot y sera ocupada tambien en la preview
                 ShareLink(item: Image(uiImage: self.generateSnapshot()),
                           preview: SharePreview("Gráfico de Temperaturas",
                                                 image: Image(uiImage: self.generateSnapshot()))){
                     //02. Personalizamos el boton
                     Label("Compartir", systemImage: "square.and.arrow.up")
                 }
                 .buttonStyle(.borderedProminent)
                 .tint(.teal)
             }
             
         }
     }
     
     @MainActor
     private func generateSnapshot() -> UIImage {
         let renderer = ImageRenderer(content: self.chartView)
         renderer.scale = UIScreen.main.scale
         return renderer.uiImage ?? UIImage()
     }
 }

 #Preview {
     ContentView()
 }
