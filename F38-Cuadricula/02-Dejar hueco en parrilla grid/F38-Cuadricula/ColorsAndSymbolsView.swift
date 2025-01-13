//
//  ColorsAndSymbolsView.swift
//  F38-Cuadricula
//
//  Created by Danilo Andrusco on 13-01-25.
//


import SwiftUI

struct ColorsAndSymbolsView: View {
    var body: some View {
        Grid{
            GridRow {
                Image(systemName: "photo")
                    .font(.system(size: 120))
                
                Image(systemName: "camera")
                    .font(.system(size: 60))
            }
            GridRow{
                Color.teal
                    .overlay {
                        Image(systemName: "camera.aperture")
                            .font(.system(size: 150))
                            .foregroundStyle(.white)
                    }
                    .gridCellColumns(2)
            }
        }
    }
}

#Preview {
    ColorsAndSymbolsView()
}
