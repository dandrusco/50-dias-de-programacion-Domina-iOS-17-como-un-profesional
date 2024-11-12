//
//  DragState.swift
//  F15-Gestos
//
//  Created by Danilo Andrusco on 27-05-24.
//

import Foundation

//2. Crearemos el enumerado que tendra  3 casos (inactivo, cuando esta precionado y el caso de movimiento que necesitara un parametro de tranlacion para ver cuanto nos hemos movido)
enum DragSate{
    case inactive
    case pressiong
    case dragging(translation: CGSize)
    
    //3. Crearemos las dos variables de estado, una para la traslacion
    var translation: CGSize {
        //5. A continuacion haremos un Switch del valor del enumerado
        switch self{
        //6. En traslacion hay dos casos, si es inactivo y solo se pulso, la traslacion sera xero
        case .inactive, .pressiong:
            return .zero
        //7. El otro caso es que si se esta moviendo, nos quedaremos con la contante de la traslacion y la devolvemos
        case .dragging(let translation):
            return translation
        }
    }
    
    //4. Y la otra para el isTapped de tipo boolenao
    var isTapped: Bool  {
        //8. Para el caso del isTappd realizaremos tambien un swich, para el primera sera el presionado y el de movimiento pero ignorando la traslacion ya que no la utilizaremos
        switch self {
        case .pressiong, .dragging:
            //9. Devolvemos true
            return true
        //10. Mientras que en el inactivo devolvemos falso ya que no esta siendo pulsada la vista
        case .inactive:
            return false
        }
        
    }
}
