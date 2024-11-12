//
//  DragState.swift
//  F17-Tinder
//
//  Created by Danilo Andrusco on 26-08-24.
//

import Foundation

//2. Crearemos un enumerado para los tres casos de arrastre
enum DragState {
    case inactive
    case pressing
    case dragging(traslation: CGSize)
    
    //3. Creamos una variable para la translacion en funcion de su estado de inactivo o presionado
    var translation: CGSize{
        switch self {
        case .inactive, .pressing:
            return .zero
        //4. En el caso de la translacion capturaremos el movimeiento
        case .dragging(let translation):
            return translation
        }
    }
    
    //5. en el caso del arrastrar, sera una variable booleana
    var isDreagging: Bool {
        switch self {
        case .dragging:
            return true
        case .pressing, .inactive:
            return false
        }
    }
    //6. Añadiremos el de presionado
    var isPressing: Bool {
        switch self{
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}
