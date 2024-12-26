//
//  KeyboardAdapter.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 26-12-24.
//

//07. Importaremos Foundation
import Foundation
import SwiftUI
//08- Importamos Combine
import Combine

//04. En vez de ser de tipo View lo cambiaremos ViewModifier ya que sera un modificador de una vista ya exsitente
//05. Eliminaremos pa Preview ya que no la vamos a necesitar
struct KeyboardAdapter: ViewModifier {
    
    //06. Creamos una variable de estado para la altura del teclado
    @State var currentHeight : CGFloat = 0
    
    //09. EL body como tal no lo ocuparemos ya que tendremos una funcion tipo body
    func body(content: Content) -> some View {
        content
            //10. Al contenido actual le metemos un padding abajo, de altura currentHeight
            .padding(.bottom, self.currentHeight)
            //11.Y cuando aparexca (.onAppear) llamaremos a la funcion handleKeyboardEvents, que programaremos a continuacion
            .onAppear(perform: handleKeyboardEvents)
    }
    
    //12. Creamos dicha funcion
    private func handleKeyboardEvents(){
        //13. Cuando aparece o desaparece la vista, necesitaremos escuchar dos notificaciones, la primera notificacion sera cuando se lanze el teclado
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            //14. Creamos una .compactMap para todas las notificaciones
            .compactMap { notification in
                //15. De las notificaciones extraeremos del diccionario userInfo opcional, la clave UIKeyboardFrameEndUserInfoKey
                notification.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect
            }
            //16. Lo mapeamos para quedarnos con la altura
            .map { rect in
                rect.height
            }
            //17. A partir de ahora nos suscribimos nosotros mismos a currentHeight
            .subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))
        
        //18. La segunda notificacion es cuando se oculte el teclado, lo dejamos en cero sin mapeo
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .compactMap { _ in
                CGFloat.zero
            }
            .subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))
        
    }
    
}

//19. Ahora necesitamos crear una extencion a la vista
extension View {
    //20. Creamos una funcion llamada keyboardAdapter que devolvera una vista
    func keyboardAdapter() -> some View {
        //21. Chequeamos la version de iOS, si es mayor o igual a iOS 14.0 devolvemos AnyView (no devolvemos nada)
        if #available(iOS 14.0, *){
            return AnyView(self)
        } else {
            //22. EN caso contrario, genereamos un ModifiedContent donde el contenido es la propia vista y el modificador es el KeyboardAdapter
            return AnyView(ModifiedContent(content: self, modifier: KeyboardAdapter()))
            //23. Ahora nos vamos al PaymentFormView
        }
    }
}

