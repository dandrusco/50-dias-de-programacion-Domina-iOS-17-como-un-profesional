//
//  DragState.swift
//  F18-AppleWallet
//
//  Created by Danilo Andrusco on 19-11-24.
//

import Foundation

//2. Creamos los enumerados para caso inactivo, presionado, el arrastre
enum DragState {
    case inactive
    case pressing(index: Int? = nil)
    case dragging(index: Int? = nil, translation: CGSize)
    
    //3. Creamos una variable para ver donde nos encontramos apartir del gesto, realizando un swicht para cada caso
    var index: Int? {
        switch self {
        case .inactive: return nil
        case .pressing(let index), .dragging(let index, _):
            return index
        }
    }
    //4. Lo mismo para la transacion
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return CGSize()
        case .dragging(_, let translation):
            return translation
        }
    }
    
    //5. Creamos otra variable para ver si estamos pulsando
    var isPressed: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
    //6. Y ahora para ver si nos movemos
    var isDragging: Bool {
        switch self {
        case .dragging:
            return true
        case .pressing, .inactive:
            return false
        }
    }
}
//7. Ahora nos vamos a la walletView
