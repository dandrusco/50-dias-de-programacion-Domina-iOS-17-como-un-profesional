//
//  F15_GestosApp.swift
//  F15-Gestos
//
//  Created by Danilo Andrusco on 20-05-24.
//

import SwiftUI

@main
struct F15_GestosApp: App {
    var body: some Scene {
        WindowGroup {
            //8. Para solucinar este errpr a la contrectView padre deveremos la misma imagen de la previe
            ContentView(){
                Image(systemName: "book.circle.fill")
                    .font(.system(size: 100))
                    .foregroundStyle(.teal)
            }
        }
    }
}
