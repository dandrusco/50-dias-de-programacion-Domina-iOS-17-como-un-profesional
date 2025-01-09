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
                 
                 //16. Ahora meteremos el boton al medio de estos dos
                 Button {
                     //17. LLamamos a generatePDF
                     self.generatePDF()
                 } label: {
                     //18. Generemos la Label
                     Label("Guardar en PDF", systemImage: "doc.plaintext")
                 }
                 //19. Configuramos el boton
                 .buttonStyle(.borderedProminent)
                 .tint(.teal)
                 //20. Para poder guardar el PDF en nuestros Archivos del iphone debemeos darle los persimos, en la misma pestaña info como lo hicimos en las imaenes, pero en este caso son dos claves que debemos añadir:
                 //21. La primera es: Application suports iTunes file sharing y debemos decirle que YES
                 //22. El segundo es Supports opening documents in place que debemos poner el valor en YES
                 
                 ShareLink(item: Image(uiImage: self.generateSnapshot()),
                           preview: SharePreview("Gráfico de Temperaturas",
                                                 image: Image(uiImage: self.generateSnapshot()))){
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
     
     //1. Creamos otro @MainActor para generar la funcion que cree los PDF
     @MainActor
     private func generatePDF() {
         //2. Generaremos el el path, con guard let nos aseguramos en caso de error, para ver todos los ficheros utilizamos FileManager para el directorio de los documentos, en in: lo guardaremos en los documentos del usuario. tomamos el first para la primera urls
         guard let docsDirectory = FileManager.default.urls(for: .documentDirectory,
                                                            in: .userDomainMask).first
        
        //3. En caso contrario no devolvemos nada
         else { return }
         
         //4. lo guardamos en el dorecorio con el nombre de temperaturas con el formato PDF
         let renderURL = docsDirectory.appending(path: "temperaturas.pdf")
         
         //5. Preparar CGGraphics para dibujo, si podemos tener en consumer que sea igual al CGDataConsumer para la URL generada como CFURL
         if let consumer = CGDataConsumer(url: renderURL as CFURL),
            //6. generamos el pdfContext para dibujar a partir del consumer
         let pdfContext = CGContext(consumer: consumer, mediaBox: nil, nil){
             //7. Rendear el resultado (método render)
             let renderer = ImageRenderer(content: self.chartView)
             //8. llamamos al renderpara rendear la informacion que yo quiera, esto espera un tamaño y el render
             renderer.render { size, renderer in
                 //9. En las opciones de dibujo sera de tipo Arrays CFString y los valores pueden ser de cualquier tipo (Any). Con kCGPDFContextMediaBox generamos el tamaño del documento
                 let options : [CFString: Any] = [kCGPDFContextMediaBox : CGRect(origin: .zero, size: size)]
                 //10.Ahora el pdfContext necesita iniciar una pagina en pdf con un diccionario de coregrafic
                 pdfContext.beginPDFPage(options as CFDictionary)
                 //11. moveremos el grafico arriba y centrado para la generacion del PDF, de lo contrario el grafico sera pegado abajo a la izquierda
                 pdfContext.translateBy(x: 100, y: 200)
                 //12. El propio render renderizara el resultado
                 renderer(pdfContext)
                 //13. Una vez que acaba la pagina...
                 pdfContext.endPDFPage()
                 //14. Lo podemos cerrar
                 pdfContext.closePDF()
                 //15. Metemos un print para notificar y mostramos la ruta completa
                 print("Hemos guardado el PDF en \(renderURL.path())")
             }
         }
     }
 }

 #Preview {
     ContentView()
 }
