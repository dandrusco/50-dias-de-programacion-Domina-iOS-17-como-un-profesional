//
//  DragState.swift
//  F15-Gestos
//
//  Created by Danilo Andrusco on 27-05-24.
//

import Foundation

enum DragSate{
    case inactive
    case pressiong
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self{
        case .inactive, .pressiong:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isTapped: Bool  {
        switch self {
        case .pressiong, .dragging:
            return true
        case .inactive:
            return false
        }
        
    }
}
