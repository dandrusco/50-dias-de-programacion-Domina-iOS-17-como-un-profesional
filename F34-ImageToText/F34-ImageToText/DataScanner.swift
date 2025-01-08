//
//  DataScanner.swift
//  F34-ImageToText
//
//  Created by Danilo Andrusco on 08-01-25.
//

import SwiftUI
//2. Importamos VisionKit
import VisionKit

//3. creamos la estructura que sera del tipo UIViewControllerRepresentable
struct DataScanner: UIViewControllerRepresentable{
    
    //4. Necesitamos crear dos Binding, el primero para comenzar a escanear y el segundo para almacenar el texto escaneado
    @Binding var startScanning: Bool
    @Binding var scannedText: String
    
    //5. Creamos el primer delegado, para ello creamos una funcion makeUIViewController a partir de un contecto que nos devolvera un DataScannerViewController
    func makeUIViewController(context: Context) -> DataScannerViewController {
        //6. Creamos el controler a partir de DataScannerViewController, con los parametros de recognizedDataTypes con un conjunto de elementos, luego el nivel de calidad qualityLevel que nos quedaremos con el balanceado, y por ultimpo es isHighlightingEnabled que nos permite destacar el texto
        let controller = DataScannerViewController(recognizedDataTypes: [.text()],
                                                   qualityLevel: .balanced,
                                                   isHighlightingEnabled: true)
        
        //22. Creamos la coneccion de que el  controller.delegate sea del context del coordinator
        controller.delegate = context.coordinator
        //23. AHora nos vamos a la COntentView
        
        //7. devolvemos el controller
        return controller
    }
    
    //8. Nuestro segundo delegado sera una funcion updateUIViewController que apartir de un contexto proporcionado por el DataScannerViewController, podremos actualizar el uiViewController
    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        //9. Si hay que comenzar a escanear...
        if self.startScanning {
            //10. Intenta si es que puedes, que el uiViewController comience el escaneo
            try? uiViewController.startScanning()
            //11. En caso contrario lo detenemos
        } else {
            uiViewController.stopScanning()
        }
    }
    //13. Para que la estructura pueda acceder al coordinador, deberemos crear una funcion makeCoordinator que devolvera el Coordinator
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    //12. Para capturar el texto escaneado debemos adoptar un metodo mas llamado DataScannerViewControllerDelegate, para ello creamos una clase que llamaremos Coordinator que heredara de NSObject e implementara el DataScannerViewControllerDelegate
    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        
        //14. Creamos una variable de tipo DataScanner
        var parent : DataScanner
        
        //15. Creamos el init para el DataScanner
        init(_ parent: DataScanner){
            //16. donde el parent es el mismo que recibimos en el constructor
            self.parent = parent
        }
        //17. Esta es la funcion que ahora deberemos sobreescribir
        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            //18. Realizaremos un switch del item seleccionado
            switch item {
                //19. EN el caso de que el item RecognizedItem sea del tipo .text, obtendremos el texto a partir de el
            case .text(let text):
                //20. al parent.scannedText sea igual al text.transcript (la version String)
                self.parent.scannedText = text.transcript
            //21. Añadimos un default break por si no es texto
            default: break
            }
        }
        
    }
    
}
