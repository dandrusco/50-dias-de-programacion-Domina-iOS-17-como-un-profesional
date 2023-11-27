//
//  ContentView.swift
//  F02-Imagenes
//
//  Created by Danilo Andrusco on 27-11-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1. Para utilizar imagenes deberemos arrastrarla hacia Assets
        //2. Para importarla utilizaremos Image y el nombre de la imagen
        Image("Bruno")
        //3. Para redimencionar la imagen
            .resizable()
        //4. para abarcar la zona segura utilizamos:
            /*.ignoresSafeArea()*/
        //5. Si queremos que la zona segura de arriba se mantenga lo hacemos asi:
            /*.ignoresSafeArea(.container, edges: .bottom)*/
        //6. Al revez con .top
            .ignoresSafeArea(.container, edges: .top)
    }
}

#Preview {
    ContentView()
}
