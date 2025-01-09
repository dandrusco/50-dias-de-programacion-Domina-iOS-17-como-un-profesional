//
//  ContentView.swift
//  F36-ImageRenders
//
//  Created by Danilo Andrusco on 09-01-25.
//

//1. Vamos a crear un fichero llamado WatherData al igual que en la clase de los graficos el F33-Charts
import SwiftUI

struct ContentView: View {
   //12 Para que la contentView pueda hacer uso de la ChartView debemos crear una variable
    var chartView = ChartView()
     
     var body: some View {
         //13. Creamos una VStack con 24 de espaciado
         VStack (spacing: 24){
             //14. Metemos la chartView
             self.chartView
             //15. Crearemos unos botones que nos permita guardar las fotos, guardar en PDF o compartir, para ello creamos una HStack
             HStack{
                 //16. Creamos el primero boton
                 Button {
                     //22. Llamaremos UIImageWriteToSavedPhotosAlbum para guardar la imagen en nuestro dispositivo, como parametro le pasaremos el render generateSnapshot y el resto de valores como nil
                     UIImageWriteToSavedPhotosAlbum(self.generateSnapshot(), nil, nil, nil)
                     //23. Recordar que debemos solicitar los permiso de la camara, para ello debemos ir al primer archivo de color azul allamado F36-ImageRenders, en TARGETS debe estar seleccionado el F36-ImageRenders, en info en Custon iOS Target Properties debemos agregar el Privacy - Photo Library Usage Description y en value debemos especificar por que la queremos utilizar, por ejemplo para guardar imagenes desde la Appi
                 } label: {
                     //17. Configuraremos la label primero
                     Label("Guardar en Fotos", systemImage: "photo")
                 }
                 .buttonStyle(.borderedProminent)
                 .tint(.teal)
                 //24. Ahora podemos arrancar el simulador y descargar la imagen para probarla, obviamente dandole los permisos correspondientes
             }
             
         }
     }
     
     //18. Para poder guardar la imagen necesitamos crear una funcion que nos devuelva una UIImage, pero debemos anteponer un @MainActor para que esta funcion sea global
     @MainActor
     private func generateSnapshot() -> UIImage {
         //19 guardaremos el contenido de la chartView en un render
         let renderer = ImageRenderer(content: self.chartView)
         //20. Meteremos un factor de escala para que la imagen se guarde con mayor resolucion de acuerdo al tamaño de la pantalla
         renderer.scale = UIScreen.main.scale
         //21.devolvemos el render de la imagen o de lo contrario una imagen vacia
         return renderer.uiImage ?? UIImage()
     }
 }

 #Preview {
     ContentView()
 }
