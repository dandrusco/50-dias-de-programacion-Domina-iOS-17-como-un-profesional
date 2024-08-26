//
//  DragState.swift
//  F17-Tinder
//
//  Created by Danilo Andrusco on 26-08-24.
//

import Foundation

enum DragState {
    case inactive
    case pressing
    case dragging(traslation: CGSize)
    
    var translation: CGSize{
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDreagging: Bool {
        switch self {
        case .dragging:
            return true
        case .pressing, .inactive:
            return false
        }
    }

    var isPressing: Bool {
        switch self{
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}
