//
//  ContentView.swift
//  F07-Figuras
//
//  Created by Danilo Andrusco on 20-12-23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        //1. Crearemos uin diagrama de Donut (utilizado para encuetas), crearemos una ZStack
        ZStack{
            //2. Pondremos un circulo
            Circle()
            //3. Configuraremos el trim y el stroke
                .trim(from: 0, to: 0.3)
                .stroke(Color(.systemCyan), lineWidth: 90)
            
            //5. Crearemos los demas circulos partiendo popr donde acaba el anterior y con diferentes colores 
            Circle()
                .trim(from: 0.3, to: 0.55)
                .stroke(Color(.systemPurple), lineWidth: 90)
            
            Circle()
                .trim(from: 0.55, to: 0.75)
                .stroke(Color(.systemMint), lineWidth: 90)
            
            Circle()
                .trim(from: 0.75, to: 1.0)
                .stroke(Color(.systemPink), lineWidth: 90)
            
        }
        //4. Configuraremos el frame para toda la ZStack
        .frame(width: 280, height: 280)
    }
}


#Preview {
    ContentView()
}

