//
//  ContentView.swift
//  F34-ImageToText
//
//  Created by Danilo Andrusco on 08-01-25.
//

//1. Creamos un nuevo fichero de SwiftUI llamado DataScanner
import SwiftUI
//24. Debemos importar VisionKit
import VisionKit

struct ContentView: View {
    
    //25. Creamos las dos variables de estado, la primera para ver si estamos escaneando, en principio falso
    @State private var startScanning = false
    //26 La segunda para el texto en principio vacio
    @State private var scannedText = ""
    
    var body: some View {
        VStack {
            //27.Metemos el DataScanner
            DataScanner(startScanning: self.$startScanning,
                        scannedText: self.$scannedText)
            //28. Como lo vamos a dividir en dos partes le pondremos un frame de 450 en la altura
            .frame(height: 450)
            
            //29. Programamos el texto
            Text(self.scannedText)
                //30. Configuramos el frame
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                //31. Pondremos un background de un rectangulo
                .background(in: Rectangle())
                //32. le metemos color con una opacidad
                .backgroundStyle(Color.teal.opacity(0.2))
        }
        .padding()
        //33. Programos una tarea acincrona
        .task {
            //34. Si el dispositivo acepta escaneo con la camara y ademas que tenga todos los permisos
            if DataScannerViewController.isSupported && DataScannerViewController.isAvailable {
                //35. Comenzamos a escanear
                self.startScanning.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
//36. Ahora deberemos entrar en el primera archivo llamado F34-ImageToText
//37. En TARGETS marcamos el F34-ImageToText
//38 Al medio seleccionamos Info
//39. En Custom iOS Target Properties deberemos añadir uno nuevo que se llama Privacy - Camara Usage Description, en type es String y en Value le ponemos: Para escanear texto de dcocumentos
//40. Para poder probarlos se debe compilar en un iphone real y no en el simulador
