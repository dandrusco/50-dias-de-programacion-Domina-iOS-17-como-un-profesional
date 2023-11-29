//
//  ContentView.swift
//  F03-Apilar
//
//  Created by Danilo Andrusco on 28-11-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1. Seleccionaremos la VStack, le damos boton derecho y seleccionaremos Embed in VStack para crear una VStack que deje a la primera dentro de esta nueva
        VStack {
            //2. Swift nos da la opcion de extraer la vista ya que pensemos que si tenemos muchas Stack el codigo coenzara a crecer y cada vez costara mas entenderlo, para ello seleccionaremos nuevamente la VStack y selecionaremos Extract Subview, nos crearea un estructura llamada ExtractedView()
            TitileView()
        }
    }
}

#Preview {
    ContentView()
}

//3. Para cambiar el nombre seleccionaremos el ExtractedView y con boton derecho seleccionaremos Refactor -> Rename, le cambiamos el nombre y le damos en enter o en el boton rename
struct TitileView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("Elige")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
            Text("Tu suscripción")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
        }
    }
}
